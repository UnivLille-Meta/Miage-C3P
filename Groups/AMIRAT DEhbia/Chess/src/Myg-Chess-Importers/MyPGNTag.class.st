Class {
	#name : 'MyPGNTag',
	#superclass : 'Object',
	#instVars : [
		'tagName',
		'value'
	],
	#category : 'Myg-Chess-Importers',
	#package : 'Myg-Chess-Importers'
}

{ #category : 'printing' }
MyPGNTag >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' tagName: ';
		print: tagName.
	aStream
		nextPutAll: ' value: ';
		print: value
]

{ #category : 'accessing' }
MyPGNTag >> tagName [

	^ tagName
]

{ #category : 'accessing' }
MyPGNTag >> tagName: anObject [

	tagName := anObject
]

{ #category : 'accessing' }
MyPGNTag >> value [

	^ value
]

{ #category : 'accessing' }
MyPGNTag >> value: anObject [

	value := anObject
]
