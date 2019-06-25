"
I represent an Ovina Sheep - superclass for ram, eve and lamb. 


"
Class {
	#name : #OvinaSheep,
	#superclass : #OvinaEntity,
	#category : #'Ovina-Model'
}

{ #category : #acccessing }
OvinaSheep >> chr [ 
	self subclassResponsibility.
]

{ #category : #acccessing }
OvinaSheep >> isNoSheep [
	"return if I represent a NoSheep"
	^self id = 'ID'
]
