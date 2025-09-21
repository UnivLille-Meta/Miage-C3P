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
