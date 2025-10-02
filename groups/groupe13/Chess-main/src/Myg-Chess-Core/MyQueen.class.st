Class {
	#name : 'MyQueen',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyQueen >> renderPieceOn: aSquare [

	^ aSquare renderQueen: self
]

{ #category : 'rendering' }
MyQueen >> targetSquaresLegal: aBoolean [

	| likeABishop likeARook |
	likeABishop := (self upRightDiagonalLegal: aBoolean)
	               , (self upLeftDiagonalLegal: aBoolean)
	               , (self downRightDiagonalLegal: aBoolean)
	               , (self downLeftDiagonalLegal: aBoolean).
	likeARook := (self upFileLegal: aBoolean)
	             , (self downFileLegal: aBoolean)
	             , (self leftFileLegal: aBoolean)
	             , (self rightFileLegal: aBoolean).
	^ likeABishop , likeARook
]
