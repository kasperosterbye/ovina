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

{ #category : #accessing }
OvinaSheep >> events [
	^OvinaEvent  all select: [ :ev | ev sheep = self ]
]

{ #category : #acccessing }
OvinaSheep >> isNoSheep [
	"return if I represent a NoSheep"
	^self id = 'ID'
]

{ #category : #acccessing }
OvinaSheep >> lastEvent: eventName [
	^ (self events select: [ :ev | ev description descTag = eventName ])
		detectMax:  [ :ev | ev eventDate ]
]

{ #category : #accessing }
OvinaSheep >> location [
	"return current location of sheep"
	^ (self lastEvent: 'flytning') value ifNil: [ 'hjemme' ]
]
