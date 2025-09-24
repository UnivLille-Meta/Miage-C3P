# Obede

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


```smalltalk
TestCase subclass: #CalculatorTest.
CalculatorTest >> testAddition
    self assert: (calculator add: 2 to: 3) equals: 5.
```

5.	Kata Exercises
Revisited coding exercises using the Kata approach to reinforce my understanding of loops, inheritance, and testing.

>>Summary:
This week, I reinforced my foundations in Pharo by combining theory (video lessons) with practice (exercises and Kata). I feel more confident with loops, iterations, inheritance, self and super, as well as writing simple unit tests.

---

# Jean-Alexis

I completed the Kata exercise and added a few suggestions from Kata2 (Natural 1-based numbering, Rover should not get over the grid border, Rover walks back, Rover walk recording). I used polymorphism as much as possible, particularly with directions. For example, each class representing a direction has the `frontCoordinates` method, which returns the x and y constants to be added to the Rover's current coordinates. These can therefore be 0, 1, or -1.

There is only one conditional statement that checks that the robot's new positions are not out of bounds.

I used the TDD principle by writing the tests before the features. It's a little difficult to grasp at first because instinctively we don't like to see an error (in this case, a failed test), but you get used to it.

I wasn't able to work in “pair-working” mode, but I still took some time to think about how to develop everything. This obviously let me code much faster.
By the way, this training allowed me to review Pharo syntax and become even more comfortable with it. Now I'm starting to enjoy coding in this new language more.

You can find my version of the Kata exercise by [clicking here](https://github.com/JA-DEL2/Kata-Group2).

# Adil 

This week, I watched the assigned videos to watch (+ all module 2) and read PDF.

## Example code tested

```smalltalk
Fruit class >> description
    ^ 'I produce fruits.'

Banana class >> description
    ^ super description , ' but only bananas.'
````

Running this code in the Playground:

```smalltalk
Transcript show: Fruit description; cr.
" => I produce fruits."

Transcript show: Banana description; cr.
" => I produce fruits. but only bananas."
```

## Observations

* The `Banana class >> description` method uses `super` to call the method from its superclass `Fruit class >> description`.
* If the `description` method is removed from `Fruit class`, a `MessageNotUnderstood` error occurs because `super` cannot find the method in the superclass like in my report 02.

Moreover, here is my version with Gautam of the kata rover called in the repo MyRober : https://github.com/GautamDemeulemeester/C3P-Gautam-Demeulemeester



