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
	#category : #'Ovina-ModelManager'
}

{ #category : #accessing }
OvinaSheepLoader class >> default [
	"return a default loader"

	defaultLoader isNil
		ifTrue: [ ^ OvinaCSVLoader new ].
	^ defaultLoader
]

{ #category : #accessing }
OvinaSheepLoader class >> default: newDefault [
	"set a default loader"

	defaultLoader := newDefault .
]

{ #category : #loading }
OvinaSheepLoader >> loadLambs [
	"return a collection of Lambs"
	self subclassResponsibility 
]

{ #category : #loading }
OvinaSheepLoader >> loadRams [
	"return a collection of Rams"
	self subclassResponsibility 
]
