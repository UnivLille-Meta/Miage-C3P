Class {
	#name : 'MyBishopTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyBishopTests >> testId [

	self assert: MyBishop new id equals: 'B'
]

{ #category : 'tests' }
MyBishopTests >> testMoves [

	| bishop squares board |
	board := MyChessBoard empty.
	board at: 'e4' put: (bishop := MyBishop white).

	squares := bishop targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( f5 g6 h7 f3 g2 h1 d5 c6 b7 a8 d3 c2 b1 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyBishopTests >> testMovesWithOponentObstacle [

	| bishop squares board |
	board := MyChessBoard empty.
	board at: 'e4' put: (bishop := MyBishop white).

	"Bishops don't jump above pieces"
	"But they eat pieces of the other color"
	"Let's put a black obstacle on g6, blocking the f5-h7 diagonal"
	board at: 'g6' put: MyBishop black.

	squares := bishop targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( f5 g6 f3 g2 h1 d5 c6 b7 a8 d3 c2 b1 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyBishopTests >> testMovesWithSameColorObstacle [

	| bishop squares board |
	board := MyChessBoard empty.
	board at: 'e4' put: (bishop := MyBishop white).

	"Bishops don't jump above pieces"
	"And they don't eat pieces of the same color either"
	"Let's put a white obstacle on g6, blocking the f5-h7 diagonal"
	board at: 'g6' put: MyBishop white.

	squares := bishop targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( f5 f3 g2 h1 d5 c6 b7 a8 d3 c2 b1 ) collect: [ :name |
				 board at: name ])
]
