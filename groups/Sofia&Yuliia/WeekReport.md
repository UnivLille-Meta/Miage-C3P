Report 1

Yuliia LOS:

Collections in Pharo

A collection is an object that stores other objects together. It is used to group items and to work with them in a uniform way.

Pharo has many collections: arrays and ordered collections (for ordered data), sets and bags (for unordered data), dictionaries (for key–value pairs), and sorted collections.

We iterate with messages like do: (apply an action to each element), collect: (transform elements), select: (filter), or inject:into: (accumulate a result). Ordered collections keep order and allow index access, while sets and dictionaries do not.

Conditionals in Pharo:

You use ifTrue: and ifFalse: instead of keywords like if in other languages. 

I read the official Pharo MOOC website to find this information.

I wrote a small program called MyCounter.

For me the main problem was uploading it to GitHub. It took me a lot of time to set up the repository and push the code.

GitHub repository link: https://github.com/YuliaLos/MyCount

The basic Pharo coding style

In Pharo, methods are usually very small and easy to read. The common rules are to keep each method focused on a single task, avoid long or complex code, and choose clear names. Control flow is also expressed by sending messages (like ifTrue: or ifFalse:) instead of using special syntax. This keeps the code uniform and simple.

There are tools in the Pharo IDE, such as Code Critics, that automatically check your methods and highlight style problems or violations of these rules. They help you see when a method is too long, too complex, or not following best practices.

# Week 1 – Sofia Demchuk  

### 1) Collections in Pharo  
This week started with collections. At first, it was a bit confusing because in Pharo collections work differently than in Python or Java. Everything is done with messages. Slowly I figured it out: there are arrays, OrderedCollections, sets, and dictionaries.  

For example, arrays have a fixed size, but OrderedCollections can grow. What I liked is that you can write something like:  

```smalltalk
#(1 2 3 4) collect: [ :each | each * 2 ].
"→ #(2 4 6 8)"
```

And you instantly see the result. I also tried `do:`, `collect:`, `select:` and `reject:`. They are very handy, even though at first I mixed them up.  

### 2) Conditionals  
Then I learned about conditionals. Pharo doesn’t use the usual `if/else` keywords. Instead, you write `ifTrue:` and `ifFalse:`.  

Example I tried:  

```smalltalk
isRaining
    ifTrue: [ Transcript show: 'Take umbrella'; cr ]
    ifFalse: [ Transcript show: 'Take sunglasses'; cr ].
``` 

### 3) Classes and methods  

Next, I created my first class. Honestly, it was a bit scary because the Pharo environment looks different from IDEs I usually use.  
I made a simple counter class `MyCounter` to experiment with instance variables and methods.  

```smalltalk
Object subclass: #MyCounter
    instanceVariableNames: 'count'
    classVariableNames: ''
    package: 'MyApp'.
```
Then I defined some methods:
```smalltalk
MyCounter >> initialize
    count := 0.

MyCounter >> increment
    count := count + 1.

MyCounter >> decrement
    count := count - 1.

MyCounter >> value
    ^ count.
```
### 4) Coding style  
I also learned about the Pharo coding style. The main idea is to keep methods short and easy to read. Another important detail: class names should start with an uppercase letter, method names with a lowercase, and parameters should also start lowercase.  

Wrong example:  
```smalltalk
Client >> Age: AnAge
    age := AnAge.
```

Correct example:  
```smalltalk
Client >> age: anAge
    age := anAge.
```

These little rules actually make a big difference when reading and sharing code.  

---

## Weekly reflection  
This week I felt like I really started to get into Pharo. At first, everything looked strange. But then it started to make sense.  

A big discovery for me was the **Ukrainian translation of Stefano Ducasse’s book by Serhii Yaroshko**, my previous teacher at the Lviv National University in Ukraine . Reading examples and explanations in my native language makes the concepts much easier to digest. I will keep using this translation along with the original version.  

I also made my first commit and push on GitHub, and created a fork with the help of another students.  That was a small but motivating step.  

---

## Sources and tools  
- videos
- *Pharo by Example* – Stefano Ducasse  
- Ukrainian translation by Serhii Yaroshko 
- My GitHub repository: [https://github.com/soniaa28/mycounter.git](https://github.com/soniaa28/mycounter.git)

---

