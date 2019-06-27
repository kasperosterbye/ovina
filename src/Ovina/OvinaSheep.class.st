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

{ #category : #acccessing }
OvinaSheep >> lastEvent: eventName [
	^ (
		(OvinaEvent  all select: [ :ev | ev sheep = self ])
		select: [ :ev | ev description descTag = eventName ])
		detectMax:  [ :ev | ev eventDate ]
]

{ #category : #accessing }
OvinaSheep >> location [
	"return current location of sheep"
	^ (self lastEvent: 'flytning') value ifNil: [ 'hjemme' ]
]
