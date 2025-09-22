#Obede

This week, I focused on deepening my understanding of Pharo syntax and core object-oriented programming concepts. I watched video tutorials on basic syntax, experimented with exercises, and practiced coding with small examples.

Topics Covered:
	1.	Basic Syntax & Expressions
Learned how to send messages and work with simple objects:

```smalltalk
'Hello World' asMorph openInWindow.
10 @ 20 "Creating a Point object"
```
Practiced the use of blocks and conditional expressions:

```smalltalk
[ :x | x even ] value: 4.  "Returns true if 4 is even"
```


	2.	Loops & Iterations
Explored plain loops and conditional loops:

```smalltalk
5 timesRepeat: [ Transcript show: 'Hello'; cr ].
[ x < 5 ] whileTrue: [ x := x + 1 ].
```

Understood how iterators differ from traditional loops in Pharo.

	3.	Inheritance, Self & Super
Reviewed inheritance concepts, how to reuse code from superclasses, and the difference between self and super:

```smalltalk
Object subclass: #Animal.
Animal >> speak
    ^ '...'.
```
Learned to call the superclass method using super:

```smalltalk
Dog >> speak
    ^ super speak, ' Woof!'
```

	4.	Unit Testing
Practiced writing unit tests to ensure methods behave as expected:

TestCase subclass: #CalculatorTest.
CalculatorTest >> testAddition
    self assert: (calculator add: 2 to: 3) equals: 5.


	5.	Kata Exercises
Revisited coding exercises using the Kata approach to reinforce my understanding of loops, inheritance, and testing.

Summary:
This week, I reinforced my foundations in Pharo by combining theory (video lessons) with practice (exercises and Kata). I feel more confident with loops, iterations, inheritance, self and super, as well as writing simple unit tests.


