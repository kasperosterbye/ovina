"
I represent an Ovina Sheep - superclass for ram, eve and lamb. 


"
Class {
	#name : #OvinaSheep,
	#superclass : #Object,
	#classInstVars : [
		'manager'
	],
	#category : #'Ovina-Model'
}

{ #category : #accessing }
OvinaSheep class >> manager [
	manager isNil
		ifTrue: [ manager := OvinaSheepManager new ].
	^manager
]

{ #category : #accessing }
OvinaSheep class >> managerReset [
	manager := nil.
]

{ #category : #accessing }
OvinaSheep class >> managersReset [
	OvinaEwe managerReset.
	OvinaLamb managerReset .
	OvinaRam managerReset .
]

{ #category : #acccessing }
OvinaSheep >> chr [ 
	self subclassResponsibility.
]
