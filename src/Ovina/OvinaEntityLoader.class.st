"
I am an abstract class to load entities into Ovina.

I require these abstract methods: 

loadRams
loadLambs
loadEves
loadEventDescription
loadEvent
"
Class {
	#name : #OvinaEntityLoader,
	#superclass : #Object,
	#classInstVars : [
		'defaultLoader'
	],
	#category : #'Ovina-ModelManager'
}

{ #category : #accessing }
OvinaEntityLoader class >> default [
	"return a default loader"

	defaultLoader isNil
		ifTrue: [ ^ OvinaCSVLoader new ].
	^ defaultLoader
]

{ #category : #accessing }
OvinaEntityLoader class >> default: newDefault [
	"set a default loader"

	defaultLoader := newDefault .
]

{ #category : #loading }
OvinaEntityLoader >> loadEventDescriptions [
	"return a collection of EventDescriptions"

	self subclassResponsibility
]

{ #category : #loading }
OvinaEntityLoader >> loadEvents [
	"return a collection of Events"

	self subclassResponsibility
]

{ #category : #loading }
OvinaEntityLoader >> loadEwes [
	"return a collection of Eves"
	self subclassResponsibility 
]

{ #category : #loading }
OvinaEntityLoader >> loadLambs [
	"return a collection of Lambs"
	self subclassResponsibility 
]

{ #category : #loading }
OvinaEntityLoader >> loadRams [
	"return a collection of Rams"
	self subclassResponsibility 
]
