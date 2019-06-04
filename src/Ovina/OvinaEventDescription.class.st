Class {
	#name : #OvinaEventDescription,
	#superclass : #OvinaEntity,
	#instVars : [
		'descID',
		'descTag',
		'descDate',
		'descComment',
		'descSeason'
	],
	#category : #'Ovina-Model'
}

{ #category : #'instance manager' }
OvinaEventDescription class >> loadEventDescriptions [
	"I put the loaded eventDescriptions in the eventDescription manager"

	| man |
	man := self manager.
	OvinaEntityLoader default loadEventDescriptions
		do: [ :eventDescription | man at: eventDescription descID  put: eventDescription ]
]

{ #category : #'instance manager' }
OvinaEventDescription class >> noEventDescription [
	"descID descTag descDate descComment descSeason"
	| noEventDescription |
	noEventDescription := self new.
	noEventDescription
		descID: 'ID';
		descTag: 'Type';
		descDate: 'Dato';
		descComment: 'Kommentar';
		descSeason: 'Sæson'.
	^ noEventDescription
]

{ #category : #accessing }
OvinaEventDescription >> descComment [
	^ descComment
]

{ #category : #accessing }
OvinaEventDescription >> descComment: anObject [
	descComment := anObject
]

{ #category : #accessing }
OvinaEventDescription >> descDate [
	^ descDate
]

{ #category : #accessing }
OvinaEventDescription >> descDate: anObject [
	descDate := anObject
]

{ #category : #accessing }
OvinaEventDescription >> descID [
	^ descID
]

{ #category : #accessing }
OvinaEventDescription >> descID: anObject [
	descID := anObject
]

{ #category : #accessing }
OvinaEventDescription >> descSeason [
	^ descSeason
]

{ #category : #accessing }
OvinaEventDescription >> descSeason: anObject [
	descSeason := anObject
]

{ #category : #accessing }
OvinaEventDescription >> descTag [
	^ descTag
]

{ #category : #accessing }
OvinaEventDescription >> descTag: anObject [
	descTag := anObject
]
