# Rapport : kata
## Douha Agouni
### Kata extensions : 
#### Natural 1-based numbering
intialize2

	super initialize.
	direction := North new.
	x := 1.
	y := 1
#### Rover should not get over the grid border
- pour cela, j'ai implémenté une nouvelle version  de la methode move: 
move2

	| p |
	p := self direction move: x @ y.
	((p x > gridSize x or: [ p y > gridSize y ]) or: [
		 p x < 0 or: [ p y < 0 ] ]) ifTrue: [ ^ self ].
	"(p x < 0 or: [ p y < 0 ]) ifTrue: [ ^ self ]."
	x := p x.
	y := p y
#### Rover walks back
back

	| p |
	p := self direction back: x @ y.
	(p x < 1 or: [ p y < 1 ]) ifTrue: [ ^ self ].
	x := p x.
	y := p y
#### Rover walk recording
reCording: aString

	| liste |
	liste := OrderedCollection new.
    aString do: [ :c |
			c = $R
				ifTrue: [ self turnRight ]
				ifFalse: [
						c = $L
							ifTrue: [ self turnLeft ]
							ifFalse: [
									c = $B
										ifTrue: [ self back ]
										ifFalse: [ self move2 ] ] ].
			liste add: self x @ self y ].

	^ liste
#### More robust communication
validInput: aString

	| temp p1 p2 p3 pos validDirections validCommands |
	validDirections := #( 'N' 'S' 'E' 'W' ).
	validCommands := #( 'M' 'B' 'L' 'R' ).

	temp := aString splitOn: Character cr.
	p1 := temp first.
	p2 := temp second.
	p3 := temp third.
	pos := p2 splitOn: Character space.

	^ (p1 allSatisfy: [ :c | c isDigit ]) and: [
			  (pos first allSatisfy: [ :c | c isDigit ]) and: [
					  (pos second allSatisfy: [ :c | c isDigit ]) and: [
							  (validDirections includes: pos third) and: [
								  p3 allSatisfy: [ :c | validCommands includes: c ] ] ] ] ]

- Pour ce point, j'ai eu un problème, le test passait dans le cas où l'input est invalide, mais pas dans le cas où l'input est valide, pour cela j'ai créé deux méthodes différentes : 
testInvalidInput

	| r invalidInput  |
	r := Roover new.
	invalidInput := '5 S
1 2 N
LNLMLMLMM'.
	
	self assert: (r validInput: invalidInput) not.
    " test passé"

- et la méthode : 
testValidInput

	| r validInput |
	r := Roover new.
	validInput := '5 5
1 2 N
RMM'.
	self assert: (r validInput: validInput)
    "test ne passe pas"
