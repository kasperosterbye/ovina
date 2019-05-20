"
I represent an Ovina Sheep - superclass for ram, eve and lamb. 


"
Class {
	#name : #OvinaSheep,
	#superclass : #Object,
	#classInstVars : [
		'manager'
	],
	#category : #Ovina
}

{ #category : #accessing }
OvinaSheep class >> manager [
	manager isNil
		ifTrue: [ manager := OvinaSheepManager new ].
	^manager
]

{ #category : #acccessing }
OvinaSheep >> chr [ 
	self subclassResponsibility.
]
