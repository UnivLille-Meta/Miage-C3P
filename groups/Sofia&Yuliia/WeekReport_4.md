# Weekly Report4 

# Yuliia LOS:

From the presentations, I learned the basics of reverse engineering in software. Reverse engineering means analyzing an existing system to understand its components, design decisions, and how everything works together. It is important because developers often work with old, undocumented systems. The key is not to get lost in the details, but to first look at the big picture: main classes, architecture, dependencies, and tests. Useful techniques include checking senders and implementors of methods, class hierarchies, and running or stepping through code with a debugger. Patterns like Speculate about Design and Refactor to Understand help to gradually make sense of the system.

I also learned about Pharo’s LRUCache. An LRU (Least Recently Used) cache works like a dictionary storing (key, value) pairs, but with a maximum size. When it is full, it removes the least recently used item. The main method is at:ifAbsentPut:, which either finds a value or computes and stores it. The cache also has a concept of weight (capacity). Studying the code showed how insertions, hits, and misses are handled, and how eviction works when the cache reaches its maximum capacity.

I also continued this week to work on the Kata.



# Sofia Demchuk
1. Basics of Reverse Engineering
   The first presentation made me realize that reverse engineering is not some “bonus skill,” but a core activity of professional developers.
According to the slides, there’s a 20/80 law: you are four times more likely to work on old, undocumented, complex systems than on new projects.

Key Lessons

- **Do not dive into details immediately** → look for *big players* (major classes, packages, responsibilities).  
- **Perspectives**: user (API), implementor (design choices), extender (hooks).  
- **Static vs dynamic analysis**: one gives architecture, the other execution.
- **Look at tests**: they reveal usage, but might only cover simple cases.
- 
**Design Smells to Notice**
- Too many conditionals (ifTrue:/ifFalse: everywhere)
- Long methods → high cyclomatic complexity
- Duplicated code
- Testing messages like isWall, isEmptyBlock… → usually a symptom of missing polymorphism.
- 
**This part of the lecture also introduced some reverse engineering patterns:**
-	Speculate about Design: guess what the design should be, then check if the code matches your hypothesis.
- Refactor to Understand: rename classes/methods while running tests, to reveal the actual intent of the code.
- Step through execution: use the debugger to confirm hypotheses — but avoid drowning in details ￼.

2. Reverse Engineering Example: LRUCache
The second presentation applied these principles to a concrete case: Pharo’s LRUCache.
I answered three questions:
1.	What is it?
-	A cache with Least Recently Used policy: when full, it removes the oldest unused entries.
2.	How is it used?
-	Works like a dictionary storing (key → value) pairs.
- Main API is at:ifAbsentPut:.

```smalltalk
primeFactorsCache := LRUCache new.
50 timesRepeat: [
   | n |
   n := 100 atRandom.
   primeFactorsCache at: n ifAbsentPut: [ n primeFactors ].
].
```
3.	How is it implemented?
- Followed the at:ifAbsentPut: method.
- Found two cases: hit (value already in cache) → handleHit:, and miss → handleMiss:.
- In handleMiss:, the cache adds the new entry and updates weight:
```smalltalk
addWeight: value
   weight add: value.
   [ weight isBelowMaximum ] whileFalse: [
      self isEmpty ifTrue: [ self error: '...' ]
                   ifFalse: [ self evict ] ].
```
 - This loop is where eviction happens when the cache exceeds its maximum weight

**What I Learned**
- You don’t need to read every line. You focus on what answers your current question and keep a backlog of “interesting but later” things (like semaphores, statistics, extensions).
- Documentation + tests + senders are often more valuable than raw code at first glance.
- Reverse engineering is iterative: each answer raises new questions.


