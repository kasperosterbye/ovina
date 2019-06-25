Class {
	#name : #OvinaEventDescription,
	#superclass : #OvinaEntity,
	#instVars : [
		'descTag',
		'descDate',
		'descComment',
		'descSeason',
		'id',
		'descDefaultValue'
	],
	#category : #'Ovina-Model'
}

{ #category : #private }
OvinaEventDescription class >> loadEntities [ 
	entities := OvinaEntityLoader default loadEventDescriptions  
]

{ #category : #'instance manager' }
OvinaEventDescription class >> noEventDescription [
	"descID descTag descDate descComment descSeason"

	| noEventDescription |
	noEventDescription := self new.
	noEventDescription
		id: 'ID';
		descTag: 'Type';
		descDate: 'Dato';
		descDefaultValue: 'Grundværdi';		descComment: 'Kommentar';
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
OvinaEventDescription >> descDefaultValue [
	^ descDefaultValue
]

{ #category : #accessing }
OvinaEventDescription >> descDefaultValue: anObject [
	descDefaultValue := anObject
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

{ #category : #public }
OvinaEventDescription >> events [
	^ OvinaEvent manager all select: [ :ev | ev descFK = id ]
]

{ #category : #accessing }
OvinaEventDescription >> id [
	^ id
]

{ #category : #accessing }
OvinaEventDescription >> id: anObject [
	id := anObject
]
