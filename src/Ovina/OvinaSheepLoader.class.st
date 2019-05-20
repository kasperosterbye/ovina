"
I am an abstract class to load sheeps into Ovina.

I implement three methods: 

loadRams
loadLambs
loadEves
"
Class {
	#name : #OvinaSheepLoader,
	#superclass : #Object,
	#classInstVars : [
		'defaultLoader'
	],
	#category : #Ovina
}

{ #category : #accessing }
OvinaSheepLoader class >> default [
	"return a default loader"
	defaultLoader isNil 
		ifTrue: [ defaultLoader := OvinaCSVLoader new ].
	^ defaultLoader 
	
]

{ #category : #accessing }
OvinaSheepLoader class >> default: newDefault [
	"set a default loader"

	defaultLoader := newDefault .
]

{ #category : #loading }
OvinaSheepLoader >> loadEves [
	self subclassResponsibility 
]

{ #category : #loading }
OvinaSheepLoader >> loadLambs [
	self subclassResponsibility 
]

{ #category : #loading }
OvinaSheepLoader >> loadRams [
	self subclassResponsibility 
]
