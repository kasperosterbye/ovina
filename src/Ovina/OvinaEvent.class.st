Class {
	#name : #OvinaEvent,
	#superclass : #OvinaEntity,
	#instVars : [
		'descFK',
		'sheepFK',
		'sheepKind',
		'eventDate',
		'value',
		'id'
	],
	#category : #'Ovina-Model'
}

{ #category : #private }
OvinaEvent class >> loadEntities [ 
	entities := OvinaEntityLoader default loadEvents  
]

{ #category : #'instance manager' }
OvinaEvent class >> noEvent [
	"eventID descFK sheepFK sheepKind eventDate value"

	| noEvent |
	noEvent := self new.
	noEvent
		eventID: 'ID';
		descFK: 'kan ikke rettes';
		sheepFK: 'kan ikke rettes';
		sheepKind: 'kan ikke rettes';
		eventDate: 'Dato';
		value: 'værdi'.
	^ noEvent
]

{ #category : #accessing }
OvinaEvent >> descFK [
	^ descFK
]

{ #category : #accessing }
OvinaEvent >> descFK: anObject [
	descFK := anObject
]

{ #category : #public }
OvinaEvent >> description [
	^ OvinaEventDescription manager at: descFK 
]

{ #category : #accessing }
OvinaEvent >> eventDate [
	^ eventDate
]

{ #category : #accessing }
OvinaEvent >> eventDate: anObject [
	eventDate := anObject
]

{ #category : #accessing }
OvinaEvent >> id [
	^ id
]

{ #category : #accessing }
OvinaEvent >> id: anObject [
	id := anObject
]

{ #category : #public }
OvinaEvent >> sheep [
	^ sheepKind manager at: sheepFK 
]

{ #category : #accessing }
OvinaEvent >> sheepFK [
	^ sheepFK
]

{ #category : #accessing }
OvinaEvent >> sheepFK: anObject [
	sheepFK := anObject
]

{ #category : #accessing }
OvinaEvent >> sheepKind [
	^ sheepKind
]

{ #category : #accessing }
OvinaEvent >> sheepKind: anObject [
	sheepKind := anObject
]

{ #category : #accessing }
OvinaEvent >> value [
	^ value
]

{ #category : #accessing }
OvinaEvent >> value: anObject [
	value := anObject
]
