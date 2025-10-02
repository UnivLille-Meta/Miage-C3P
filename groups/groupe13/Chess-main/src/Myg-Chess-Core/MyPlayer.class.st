Class {
	#name : 'MyPlayer',
	#superclass : 'Object',
	#instVars : [
		'color',
		'game'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'constants' }
MyPlayer >> black [

	self color: Color black
]

{ #category : 'accessing' }
MyPlayer >> color [

	^ color
]

{ #category : 'accessing' }
MyPlayer >> color: anObject [

	color := anObject
]

{ #category : 'accessing' }
MyPlayer >> game [

	^ game
]

{ #category : 'accessing' }
MyPlayer >> game: anObject [

	game := anObject
]

{ #category : 'testing' }
MyPlayer >> isWhite [
	
	^ color = Color white
]

{ #category : 'accessing' }
MyPlayer >> king [
	
	^ self pieces detect: [ :p | p isKing ]
]

{ #category : 'accessing' }
MyPlayer >> pieces [

	^ game pieces select: [ :p | p notNil and: [ p color = self color ] ]
]

{ #category : 'playing' }
MyPlayer >> play [

	| pieces |
	pieces := self king isInCheck
		          ifTrue: [ OrderedCollection with: self king ]
		          ifFalse: [ self pieces copy asOrderedCollection ].


	[ pieces notEmpty ] whileTrue: [
		| piece legalMoves |
		piece := pieces atRandom.
		pieces remove: piece.
		legalMoves := piece legalTargetSquares.
		legalMoves ifNotEmpty: [
			game move: piece to: legalMoves atRandom.
			^ self ] ].

	self halt: 'NO MOVES AVAILABLE!'
]

{ #category : 'constants' }
MyPlayer >> white [

	self color: Color white
]
