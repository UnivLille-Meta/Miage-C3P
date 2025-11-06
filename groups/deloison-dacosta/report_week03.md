# Report Week 3

# Antonin DELOISON

First, I watch the videos on Module 3: Hooks.

Next, I make three improvements to the Kata rover.

### First improve : Natural 1-based numbering.

First, I modify the assertions in ‘testInitialize’ in RooverTest to replace them with 1.

`````
testInitialize

	| r |
	r := Roover new.
	r interpretInit: '1 2 E'.

	self assert: r x equals: 1.
	self assert: r x equals: 1.
	self assert: r direction equals: East new
`````

Next, the test is orange, and I modify the code so that the test turns green, setting the default initial position to (1,1).

`````
initialize

	super initialize.
	direction := North new.
	x := 1.
	y := 1
`````

### Second improve : Rover should not get over the grid border.

To achieve this improvement, I began by creating a ‘testCanMove’ test to determine whether the rover can move.

`````
testCanMove

	self assert: (North new canMove: 4 @ 1 within: 3 @ 3) equals: false
`````
Here, the result is incorrect, because 4 > 3 and the rover leaves the grid.

I create a canMove method in Direction that takes two parameters, the point and the grid. All directions use the same method.

`````
canMove: newPoint within: gridSize

	^ (newPoint x between: 1 and: gridSize x) and: [
		  newPoint y between: 1 and: gridSize y ]
``````

The objective of this method is to verify whether the new point lies between 1 and the size of the grid.

For each movement method, I adapted the code to create the new point and verify whether or not it can be used.

````
move: aPoint within: gridSize

	| newPoint |
	newPoint := aPoint x @ (aPoint y + 1).
	(super canMove: newPoint within: gridSize)
		ifTrue: [ ^ newPoint ]
		ifFalse: [ ^ aPoint ]
`````
Example using the move method in North. Now I create the new point and check with canMove in the superclass whether the point is valid. If we can use it, we return the new point, otherwise we return the current point.

### Third improve : Rover walks back.

For the rover to move backwards, it is exactly the same as moving forwards. We need to create a moveBack method in Roover, call moveBack in one direction, and check canMove with the new point.

moveBack in Roover :

`````
moveBack

	| p |
	p := self direction moveBack: x @ y within: gridSize.
	x := p x.
	y := p y
``````

moveBack in any direction is the opposite of move on. Example: to go south, we must do y - 1; to move backwards, we must do y + 1.

Example of moving backwards from the south:

`````
moveBack: aPoint within: gridSize

	| newPoint |
	newPoint := aPoint x @ (aPoint y + 1).
	(super canMove: newPoint within: gridSize)
		ifTrue: [ ^ newPoint ]
		ifFalse: [ ^ aPoint ]
`````

My improves is availables here : [Git](https://github.com/antonindeloison/PharoProjects/tree/main/Roover)

# Matéo DA COSTA

## The Martian

After our kata last week, we were invited to finish the rover implementation and add some extensions to it.


### Juno : New origins
I worked on changing the origin of the grid from (0,0) to (1,1).
- I modified the test :
```smalltalk
testGridSize

	| r |
	r := Roover new.
	r interpretCommand: '5 5
1 2 N 
LMLM'.
	self assert: r gridSize equals: 5 @ 5 "from (6,6) to (5,5)"
```
- the interpreter :
```smalltalk
interpretCommand: aString

	| input grid |
	input := aString splitOn: Character cr.
	grid := input first splitOn: Character space.
	self gridSize: grid first asInteger @ grid second asInteger
```
- and the initializer :
````smalltalk
initialize

	super initialize.
	direction := North new.
	x := 1.
	y := 1
````

### Spaced out
To ensure the integrity of our body, I am making sure it doesn’t go beyond the bounds.

- First of all, I changed its default start values :
```smalltalk
testDefaultRooverPositionIsAtZeroZero

	| r |
	r := Roover new.
	self assert: r x equals: 1.
	self assert: r y equals: 1
```
- Then I changed the assertion for the `interpretDirection` test affected by the new default value:
````smalltalk
testInterpretDirection

	| r |
	r := Roover new.
	r interpretDirection: 'MMRMM'.

	self assert: r x equals: 3.
	self assert: r y equals: 3.
	self assert: r direction equals: East new
````
- I did the same for the `fullInterpret` test :
```smalltalk
testFullInterpret

	| r |
	r := Roover new.
	r interpretFullCommand: '5 5
1 2 N 
LMLMLMLMM'.

	self assert: r x equals: 2.
	self assert: r y equals: 3.
	self assert: r direction equals: North new
```
- And the `move` test :
```smalltalk
testMove

	| r |
	r := Roover new.
	r move.
	self assert: r x equals: 1.
	self assert: r y equals: 2
```
- Finally, my new test when the rover tries to go out of bounds :
```smalltalk
testMoveOutOfBounds

	| r |
	r := Roover new.
	r direction: South new.
	r move.
	self assert: r x equals: 1.
	self assert: r y equals: 1
```
- To succeed in this test, I added a condition to my `move` method :
```smalltalk
move

	| p |
	p := self direction move: x @ y.
	p x > 0 ifTrue: [ x := p x ].
	p y > 0 ifTrue: [ y := p y ]
```

### ~~Moon~~ Mars walk
With the instruction 'B', I made it possible for the rover to go backward from its **Direction**.

- I started by making a test :
```smalltalk
testMoveBackward

	| r |
	r := Roover new.
	r direction: South new.
	r moveBackward.
	self assert: r x equals: 1.
	self assert: r y equals: 2
```
- I created a new `moveForward`, but to avoid changing all my tests, I made it the same as `move`, just with another name to prevent confusion in my future implementations :
```smalltalk
moveForward

	self move
```
- I created `moveBackward` by calling `moveBack` on the **Direction** :
```smalltalk
moveBackward

	| p |
	p := self direction moveBack: x @ y.
	p x > 0 ifTrue: [ x := p x ].
	p y > 0 ifTrue: [ y := p y ]
```
- Then, for each **Direction**, I wrote a test :
```smalltalk
testEastMoveBack

	self assert: (East new moveBack: 0 @ 0) equals: -1 @ 0
```
- And the corresponding implementation :
```smalltalk
moveBack: aPoint

	^ aPoint x - 1 @ aPoint y
```
- Finally, I added the $B term in the **Direction** interpreter : 
```smalltalk
interpretDirection: aString

	aString do: [ :c |
			c = $R
				ifTrue: [ self turnRight ]
				ifFalse: [
						c = $L
							ifTrue: [ self turnLeft ]
							ifFalse: [
									c = $B
										ifTrue: [ self moveBackward ]
										ifFalse: [ self moveForward ] ] ] ]
```

### Conclusion
To summarize, this kata taught me how to make design choices, and also how to translate a set of requirements into a Pharo implementation.

My project is available here: [GitHub Repository](https://github.com/username/project)

## Captain Hook
This week was dedicated to the "key point of object-oriented design which is how to design abstractions that are extensible using hooks".

### Message Sends
Every self-send is a potential hook because subclasses can override these methods. Writing small methods with self-sends increases extensibility.

### The Template Method
You can define the skeleton of an algorithm in the superclass.   Then you call hooks so that subclasses can customize parts of the algorithm without changing the overall structure.

### Why Use It
- Use hooks to avoid code duplication
- Write smaller, clearer methods that can be easily redefined
- Apply this to make a design extensible in a parameterized way instead of a monolithic one (e.g. `printOn:`, `postCopy`)

### My Gains
I already knew the Template Method pattern, but I learned how to design my code better by writing smaller methods and identifying self-sends as future hooks.

**Source:** [Pharo MOOC: Module 3: Hooks](https://advanced-design-mooc.pharo.org/#module3)  