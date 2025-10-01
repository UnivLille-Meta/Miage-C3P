# Exercises

In this practice we will step by step explore the `LRUCache` class in Pharo11, try to understand it and understand how to use our every-day tools to do this.

## Objective

Let's put the hat of a developer that needs to use an LRUCache for some project.
We need to understand
- What it is
- How it is used

And, a bit the implementation just in case. Imagine we need to prepare ourselves to fix a bug, improve its performance or add a feature.

## What is an LRU Cache?

One first step to understanding a piece of code is to try to understand the domain it represents.
In the case of an LRU cache, we can certainly find lots of info online about what are caches and what does LRU mean in that context.

Things to explore and think about:
- Check wikipedia for definitions of caches and LRU caches.
- Are there alternative strategies to LRU? What is the difference between LRU and LFU?

## Giving a quick look of the project

Use the system browser to look at the `System-Caching` package.
Find interesting classes and explore them quickly.
Do they have class comments with useful information?
Get a rough estimation of the amount of work you need to put: How large are those classes? How many methods do they have?

Things to explore and think about:
- Do you see interesting hierarchies?
- What information could you *ignore*?
- What are these *grayed* classes? Is it important? Could we skip that information for later?

**Tip:** Keep the focus on what your goal is. Do not check directly all the things that you are interested about. Write them down in a `TODO` list for later.

The `LRUCache` comment has nice examples, and taught us that it works as a dictionary and that one of the main methods is `at:ifAbsentPut:`.
What does the following example do? Do you need to read all the code of the called methods to understand it?

```smalltalk
primeFactorsCache := LRUCache new.
50 timesRepeat: [
  | n |
  n := 100 atRandom.
  primeFactorsCache at: n ifAbsentPut: [ n primeFactors ] ].
```

## From a user perspective: Understanding incomping dependencies

Another way to see how the `LRUCache` is used is by looking at other code examples.
For this, we can look for *usages* of this class.

**Tip:** Many IDEs allow to navigate the code checking usages and definitions of the code. In Pharo, you can
- select a class name and from the context menu do *Code Search > Browse* to get to the definition, and *Code Search > References* to see where it is used.
- select a method name and from the context menu do *Code Search > implementors* to get to methods implementing that selector, and *Code Search > senders* to see where it is used.

Check for senders of `at:ifAbsentPut:`. How many senders does it have? Are there any false positives (i.e., calls that are not to `LRUCache`)? Why?

Narrow the search by looking for references to `LRUCache`. How many of them are there? Spend 5 minutes and read them all.
How many are tests? Are there new usages of the class that we did not see before?

## Implementor’s Hat: Inserting entries in the cache

Let's make a hypothesis. Now that we have read the wikipedia page and we are cache experts, we can assume that
- a cache hit means that the looked up element is in the cache
- a cache miss means that the looked up element is not in the cache
- when a miss happens, probably we are going to insert something in the cache
- and if the cache gets full, we will need to remove (evict) some old element using our LRU replacement policy!

Let's read the code of `at:ifAbsentPut:` and try to understand it. Use the method comment as help.

```smalltalk
at: key ifAbsentPut: block
	"If key is present in the cache, return the associated value.
	This is a hit and makes that key/value pair the most recently used.
	If key is absent, use block to compute a new value and cache it.
	Block can optionally take one argument, the key.
	This is a miss and will create a new key/value pair entry.
	Furthermore this could result in the least recently used key/value pair
	being removed when the specified maximum cache weight is exceeded."

	self critical: [ | association |
		association := keyIndex
			associationAt: key
			ifAbsent: [ | value |
				value := block cull: key.
				"Sadly we have to check the presence of key again
				in case of the block execution already added the entry"
				keyIndex
					associationAt: key
					ifAbsent: [
						association := self newAssociationKey: key value: value.
						^ self handleMiss: association ] ].
		^ self handleHit: association ]
```

*Focus on the important*: do you see the code for the hits and the misses?
We want to understand the insertion. Should we dive into the hit or the miss code?

Things to explore and think about:
- What could you ignore from the code?
- What can you *assume* from the code without looking inside? For example, think about the call to `critical:`.
- What are these *grayed* classes? Is it important? Could we skip that information for later?

Check the code of the interesting method and find where the insertion happens.
However, it is not yet evident where the eviction happens.
Do you have a hunch? Check the surrounding code.

## What did we learn about LRUCache?

- LRU Cache is a cache with a Least Recently Used policy
- Works as a (key, value) pair
- Main API: at:ifAbsentPut:
- Has a max capacity, evicts elements to not surpass it

## What did we ignore about LRUCache?

- How the LRU policy is implemented
- How is the weight/eviction implemented?
- Is it thread-safe? How? How does Pharo concurrency work?

- Many classes: Statistics, TTLCache…
- How do Pharo random generators work?

## Takeaways
- Focused on the target and the task at hand
- Ignore things not in focus, keep a log for later
- You will probably ignore more things than those that you learn
- Flow: High-level View => Usage => Implementation

- Comments had important info: the why of the design
- Senders show examples of users!
- Methods were too detailed: learn what lines to ignore

### Going further

You may want to analyse other mid-sized projects to practice your reverse engineering skills.
We recommend you take a look at the following

- AVL is an implementation of balanced trees https://github.com/pharo-containers/AVL
- Artefact is a generator of PDF documents https://github.com/pharo-contributions/artefact

### Tasks

For each project perform *at least* the following analyses.

Tips:
- Check the code from the Class browser,
- Execute examples from the playground,
- Inspect the results using the inspector.
- Execute the tests with DrTests (see menus)
- Check the options in the browser/playground (senders, implementors) what do they do and why are they useful?

#### From a user perspective
- Is there good starting documentation? Look for installation instructions, starting points, examples.
- How do we use the project/library?
- What does it do? Why would you use it?
- What are the key classes to look at?

#### From an implementor/contributor perspective
- how is it implemented? Do you recognize some known patterns?
- what are the invariants? For AVL you will see plenty since it is a data structure. For Artefact, can you zoom into a feature and get some insights?
- what is the design?

#### What about tests
- Are there tests?, do they run?
- Is coverage good? Are there missing tests?
- What kind of tests do you find? Positive, negative, boundary checks?

#### Propose improvements
Either
- improving existing tests 
- proposing new (missing) tests
- if you find problems please open issues in the github repository of the project
- you can also propose pull requests to address problems and improve the project
