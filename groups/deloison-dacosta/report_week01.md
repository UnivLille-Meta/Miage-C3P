# Report Week 1 


# Antonin DELOISON


### Learn about collections in Pharo and their iterators

A collection is an object that can contain multiple elements so that they can be manipulated. In Pharo, everything is an object, so a collection is an object that can contain other objects.

You can use the collection to store object, access to the object, modify or delete specific object in the collection.

In Pharo, there are 
- Ordered collections like OrderedCollection and Array
	```
	|c|
	c := OrderedCollection new.
	c add: 2.
	c add: 3
- No ordered collections like Set 
	```
	|c|
	c := Set new.
	c add: 4.
	c add: 5
- Associative collections like Dictionnary 
	````
	|dictionnary|
	dictionnary := Dictionary new.
	dictionnary at: #name put: 'Jean'.
	dictionnary at: #age put: 31
- Specialised collections like Integer and String

To iterate over a collection, you can use different methods:

- do : to iterate
	````
	dictionnary do: [ :each | Transcript show: each printString; cr ].
- reject / select : select / reject matching elements
	````
	#(16 19 22 25) select: [ :n | n even ] 
	"Result : #(16 22)"
	
	#(16 19 22 25) reject: [ :n | n even ] 
	"Result : #(19 25)"
- collect : iterate and collect element
	````
	#(4 −5 1 −2 9) collect: [ :each | each abs ]
	"Result : #(4 5 1 2 9)"
- detect: get first element matching
	`````
	#(4 5 1 2 9) detect: [ :n | n < 2]
	"Result : #(1)"
- includes: test inclusion
	`````
	#(4 5 1 2 9) includes: 2
	"Result : true"
- detect:ifNone: get first element matching or a default value
	`````
	#(4 5 1 2 9) detect: [:n | n > 10] ifNone: [0]
	"Result : 0"
Sources :

- M0-2 Pharo Syntax in a Nutshell - [PDF](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC/Week1/C019-W1S05-PharoSyntaxInANutshell.pdf) / [Video](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC-Videos/EN/Week1/C019SD-W1-S5-EN-V1.mp4)
- M0-12 Iterators - [PDF](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC/Week3/C019-W3S09-Iterators.pdf) / [Video](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC-Videos/EN/Week3/C019SD-W3-S9-EN-V1.mp4)
- [Main collections](https://www.youtube.com/watch?v=RCEizZ5h6Dg&ab_channel=InriaLearningLab)


### Learn about conditionals in Pharo

In Pharo, there are many methods to write conditionals :

- Boolean operators -> & , | , not
	````
	true & false.  "result: false"
	true | false.  "result: true"
	true not.      "result: false"
- Lazy boolean operators -> and: & or:
	`````
	true and: [ 10 > 9 ].  "result: true"
	false or: [ 6 > 2 ].  "result: true"
- XOR -> exclusive OR
	`````
	true xor: false.   "result: true"
	true xor: true.    "result: false"
- Conditional Messages
	-   `ifTrue: [ ... ]` : executes block if boolean is true
	
			Transcript open.
			(5 > 3) ifTrue: [ Transcript show: '5>3'; cr ].    
	-   `ifFalse: [ ... ]` : executes block if boolean is false
	
			Transcript open.
			(5 < 3) ifFalse: [ Transcript show: '3<5'; cr ].
    
	-   `ifTrue:ifFalse: [ ... ] [ ... ]` : if/else
		````
		Transcript open.
		(7 > 5)
		    ifTrue: [ Transcript show: '7 est supérieur à 5'; cr ]
		    ifFalse: [ Transcript show: '7 est inférieur ou égal à 5'; cr ].
    
	-   `ifFalse:ifTrue:` : same as `ifTrue:ifFalse:` but reversed
	- `ifEmpty: & ifNotEmpty:` 
	
In Pharo, conditions are messages send to boolean object (true or false). There is no instructions, we only use blocks after the condition.

For benefits, I think the fact of every condition is with the Boolean object simplifies understanding and significantly reduce coding errors.


As for the disadvantages, the only one I can see is that having a block with a lot of action becomes incomprehensible.

Sources :

- Booleans and Conditions [PDF](https://rmod-pharo-mooc.lille.inria.fr/OOPMooc/01-Welcome/W1S07-BasicBooleansAndCondition.pdf)


### Learn how to create classes and methods

I wrote a programme about a library where you can add members and books. You can search for a book or a member. The programme was developed using TDD. To create this programme, I used various sources. [Git](https://github.com/antonindeloison/LibraryProject.git)

During this project, I encountered numerous syntax issues, such as how to return an object, insert a parameter into a method, or create a test class. I resolved these issues by rereading the documentation.

Sources :

- M0-3 Class and Method Definitions - [PDF](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC/Week1/C019-W1S06-ClassAndMethodDefinition.pdf)
- M0-11 Class methods - [PDF](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC/Week3/C019-W3S06-BasicClassMethods.pdf) / [Video](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC-Videos/EN/Week3/C019SD-W3-S6-EN-V1.mp4)

### Learn about the basic Pharo coding style

Common rules :

- The median for Pharo methods is 3 lines of code. (excluding tests)
- Descriptive, simple names without cryptic abbreviations.
- Separate the signature and comment from the body of the method.
- No overly long blocks, extract using method.
- Do not reuse the same temporary variables for different roles.
- Do not overload fundamental messages (e.g. redefine size)

Pharo offers Critique Browser, an integrated tool that flags violations of style rules and best practices.

Examples of code violation :

- Here the name of the method is blur, what doStuff means ?
````
doStuff: a
    | x |
    x := a asString.
    Transcript show: x.
    ^ x
````
- These is a block imbrication, here we need to realize an extract method
`````
numbers do: [:n | 
    (n > 0 and: [n odd])
        ifTrue: [ (n < 1000)
            ifTrue: [ (n squared + 3) > 500 ifTrue: [ results add: n ] ] ] ].
`````


Sources :

- Pharo with Style [PDF](https://inria.hal.science/hal-03687860/file/PharoWithStyle.pdf)


### Extras

Cascade is for sending multiple messages to an object with one instance.

A block in Pharo is a small anonymous function, written between square brackets [...], which can be executed later with a value.
It is used for conditions, loops, iterations and callbacks, capturing variables from its context as needed.


Sources :

- M0-7 Understanding Messages: Sequence and Cascade [PDF](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC/Week2/C019-W2S04-Messages-Sequence.pdf) / [Video](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC-Videos/EN/Week2/C019SD-W2-S4-EN-V1.mp4)
- M0-8 Introduction to Blocks [PDF](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC/Week2/C019-W2S06-Blocks.pdf) / [Video](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC-Videos/EN/Week2/C019SD-W2-S6-EN-V1.mp4)

# Matéo DA COSTA

# Pharo Programming Notes

## Collections and Iterators

### Collections
A **collection** is the abstract superclass of all classes that represent a group of elements. It is used to store, organize, and manipulate sets of objects in Pharo.  

Common collection types include:

- `OrderedCollection`  
- `Array`  
- `Set`  
- `Dictionary`  

And other more : 
![Collections](images/CollectionInheritance.png)  

**Source:** [YouTube: Pharo Collections](https://www.youtube.com/watch?v=RCEizZ5h6Dg)

---

### Iterators

- **`collect:`** is an iterator that transforms a collection by applying a block to each element and returns a new collection of the same kind.  
- **`do:`** is a message sent to a collection. It instructs the collection to iterate over its elements. 

**Source:** [Pharo MOOC: Iterators](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC/Week3/C019-W3S09-Iterators.pdf)  

**Tip:** I used `Cmd + M` as a shortcut to navigate methods description in the playground.

## Conditionals

In Pharo, conditionals are **used as messages**.

Example:

```smalltalk
Weather isRaining
    ifTrue: [ self takeMyUmbrella ]
    ifFalse: [ self takeMySunglasses ]
```

- `True` and `False` are **unique instances of their respective classes**, not primitive types. This design provides greater flexibility, allowing you to customize the behavior of a class when it receives these messages.  
- In my opinion, choosing between lazy or eager evaluation is useful for dynamically modifying class behavior, although it can make nested conditionals harder to read.  

**Sources:**  
- [Pharo MOOC: Basic Booleans and Conditionals](https://rmod-pharo-mooc.lille.inria.fr/OOPMooc/01-Welcome/W1S07-BasicBooleansAndCondition.pdf)  
- [YouTube: Pharo Conditionals](https://www.youtube.com/watch?v=lsnndemTkao)

## Classes and Methods

To better understand how to use Pharo and, in particular, the IDE, I practiced **extreme TDD** by redoing the Counter exercise.

**Goal:**  
Create a counter object that can be incremented, decremented, and queried for its current value. This exercise introduces:

**Steps:**

1. Create a package  
2. Create a TestClass  
3. Write the first accessor test  
4. Implement the accessor method  
5. Pass the test  
6. Repeat the TDD cycle for `increment` and `decrement`  

**Sources:**  
- [Pharo MOOC: Pharo Syntax in a Nutshell](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC/Week1/C019-W1S05-PharoSyntaxInANutshell.pdf)  
- [Pharo MOOC: Counter Exercise](https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC/Week1/Exo-Counter.pdf)

## Basic Pharo Coding Style

While using extreme TDD, I encountered some common issues for each test.

- **First issue:** The class had not been created yet.  
![Class not created](images/ClassError.png)

- **Other issues:** Methods were not implemented yet, causing test failures.  
![Methods not implemented](images/MethodError.png)

These examples highlight typical **violations of Pharo coding rules**.
