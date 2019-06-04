Class {
	#name : #OvinaEventDescription,
	#superclass : #OvinaEntity,
	#instVars : [
		'descTag',
		'descDate',
		'descComment',
		'descSeason',
		'id'
	],
	#category : #'Ovina-Model'
}

{ #category : #accessing }
OvinaEventDescription class >> loadSelector [
	^ #loadEventDescriptions
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

{ #category : #accessing }
OvinaEventDescription >> id [
	^ id
]

{ #category : #accessing }
OvinaEventDescription >> id: anObject [
	id := anObject
]
