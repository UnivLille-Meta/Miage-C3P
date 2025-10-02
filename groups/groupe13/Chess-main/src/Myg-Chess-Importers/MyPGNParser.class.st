"
# Example

```
p := (MyPGNParser forString: '[Event ""F/S Return Match""]
[Site ""Belgrade, Serbia JUG""]
[Date ""1992.11.04""]
[Round ""29""]
[White ""Fischer, Robert J.""]
[Black ""Spassky, Boris V.""]
[Result ""1/2-1/2""]

1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O Be7 6. Re1 b5 7. Bb3 d6 8. c3
O-O 9. h3 Nb8 10. d4 Nbd7 11. c4 c6 12. cxb5 axb5 13. Nc3 Bb7 14. Bg5 b4 15.
Nb1 h6 16. Bh4 c5 17. dxe5 Nxe4 18. Bxe7 Qxe7 19. exd6 Qf6 20. Nbd2 Nxd6 21.
Nc4 Nxc4 22. Bxc4 Nb6 23. Ne5 Rae8 24. Bxf7+ Rxf7 25. Nxf7 Rxe1+ 26. Qxe1 Kxf7
27. Qe3 Qg5 28. Qxg5 hxg5 29. b3 Ke6 30. a3 Kd6 31. axb4 cxb4 32. Ra5 Nd5 33.
f3 Bc8 34. Kf2 Bf5 35. Ra7 g6 36. Ra6+ Kc5 37. Ke1 Nf4 38. g3 Nxh3 39. Kd2 Kb5
40. Rd6 Kc5 41. Ra6 Nf2 42. g4 Bd3 43. Re6 1/2-1/2').


p  parse
```
"
Class {
	#name : 'MyPGNParser',
	#superclass : 'Object',
	#instVars : [
		'stream'
	],
	#category : 'Myg-Chess-Importers',
	#package : 'Myg-Chess-Importers'
}

{ #category : 'parsing' }
MyPGNParser class >> forString: aString [

	^ self new
		  stream: aString readStream;
		  yourself
]

{ #category : 'parsing' }
MyPGNParser class >> parse: aString [

	^ (self forString: aString readStream) parse
]

{ #category : 'as yet unclassified' }
MyPGNParser >> nextToken [

	| token specialSymbols |
	specialSymbols := #( $* $( $) $< $> $  $[ $] ).
	
	stream peek ifNil: [ ^ nil ].

	(#( $* $( $) $< $> ) includes: stream peek) ifTrue: [
		self notYetImplemented ].

	stream peek = $[ ifTrue: [ ^ stream next: 1 ].

	stream peek = $. ifTrue: [ ^ stream next: 1 ].

	stream peek = $" ifTrue: [
		stream next.
		^ stream upTo: $" ].

	token := stream upToAny: {
			         Character space.
			         Character tab.
			         Character cr.
			         $. }.

	stream position: stream position - 1.
	stream peek = $. ifFalse: [ stream skip: 1 ].
	token isEmpty ifTrue: [ ^ self nextToken ].
	^ token
]

{ #category : 'parsing' }
MyPGNParser >> parse [

	^ {
		  self parseTagPairs.
		  self parseMoveSection.
		  self nextToken }
]

{ #category : 'as yet unclassified' }
MyPGNParser >> parseMoveNumber [

	| number dotCount |
	number := self nextToken.

	dotCount := 0.
	[ self peekToken = '.' ] whileTrue: [
		dotCount := dotCount + 1.
		self nextToken ].
	^ {
		  number.
		  dotCount }
]

{ #category : 'as yet unclassified' }
MyPGNParser >> parseMoveSection [

	| movement movements |
	movements := OrderedCollection new.
	[ (movement := self parseMovement) notNil ] whileTrue: [
		movements add: movement ].

	^ movements
]

{ #category : 'as yet unclassified' }
MyPGNParser >> parseMovement [

	| nextToken moveNumber firstMovement |
	nextToken := self peekToken.
	(#( '1-0' '0-1' '1/2-1/2' '*' ) includes: nextToken) ifTrue: [ ^ nil ].

	moveNumber := self parseMoveNumber.
	nextToken := self peekToken.
	(nextToken first isDigit or: [
		 #( '1-0' '0-1' '1/2-1/2' '*' ) includes: nextToken ]) ifTrue: [
		^ { moveNumber } ].

	firstMovement := self nextToken.
	nextToken := self peekToken.
	(nextToken first isDigit or: [
		 #( '1-0' '0-1' '1/2-1/2' '*' ) includes: nextToken ]) ifTrue: [
		^ {
			  moveNumber.
			  firstMovement } ].

	^ {
		  moveNumber.
		  firstMovement.
		  self nextToken }
]

{ #category : 'as yet unclassified' }
MyPGNParser >> parseTag [

	| tag |
	(self nextToken = '[') ifFalse: [ ^ nil ].
	
	tag := MyPGNTag new
		tagName: self nextToken;
		value: self nextToken;
		yourself.

	"Consume closing bracket"
	self nextToken.
	^ tag
]

{ #category : 'as yet unclassified' }
MyPGNParser >> parseTagPairs [

	| tag tags |
	tags := OrderedCollection new.
	[ (tag := self parseTag) notNil ] whileTrue: [ tags add: tag ].

	"Consume separator line"
	stream skip: 1.
	
	^ tags
]

{ #category : 'as yet unclassified' }
MyPGNParser >> peekToken [

	| before token |
	before := stream position.
	token := self nextToken.
	stream position: before.
	^ token
]

{ #category : 'accessing' }
MyPGNParser >> stream: aReadStream [ 
	stream := aReadStream
]
