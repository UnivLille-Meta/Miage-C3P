Class {
	#name : 'BaselineOfMygChess',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMygChess',
	#package : 'BaselineOfMygChess'
}

{ #category : 'baselines' }
BaselineOfMygChess >> baseline: spec [

	<baseline>
	spec
		baseline: 'Bloc'
		with: [ spec repository: 'github://pharo-graphics/Bloc:v2.0.0/src' ].

	spec
		baseline: 'Toplo'
		with: [ spec repository: 'github://plantec/Toplo:v0.1.0/src' ].

	spec
		package: 'Myg-Chess-Core'
		with: [ spec requires: #( 'Myg-Chess-Importers' ) ];
		package: 'Myg-Chess-Importers';
		package: 'Myg-Chess-Tests'
		with: [ spec requires: #( 'Myg-Chess-Core' ) ]
]
