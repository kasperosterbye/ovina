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

{ #category : #acccessing }
OvinaSheep >> chr [ 
	self subclassResponsibility.
]
