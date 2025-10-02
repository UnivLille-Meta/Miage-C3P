Class {
	#name : 'MyFENTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyFENTest >> testParseBlackPawn [

	| parser piece |
	parser := MyFENParser forString: 'p'.
	piece := parser parsePiece.
	
	self assert: piece equals: 'Black pawn'
]

{ #category : 'tests' }
MyFENTest >> testParseRank [

	| parser rank |
	parser := MyFENParser forString: 'p2rQknB'.
	rank := parser parseRank.
	
	self assert: rank asArray equals: #(
		'Black pawn'
		$2
		'Black rook'
		'White queen'
		'Black king'
		'Black knight'
		'White bishop'
	)
]

{ #category : 'tests' }
MyFENTest >> testParseWhitePawn [

	| parser piece |
	parser := MyFENParser forString: 'P'.
	piece := parser parsePiece.
	
	self assert: piece equals: 'White pawn'
]
