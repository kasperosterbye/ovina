Class {
	#name : #OvinaEventDescription,
	#superclass : #Object,
	#instVars : [
		'descID',
		'descTag',
		'descDate',
		'descComment',
		'descSeason'
	],
	#category : #'Ovina-Model'
}

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
