Class {
	#name : #OvinaEwe,
	#superclass : #OvinaSheep,
	#instVars : [
		'eweID',
		'name',
		'chr',
		'number',
		'inDate',
		'race',
		'outDate'
	],
	#category : #'Ovina-Model'
}

{ #category : #'as yet unclassified' }
OvinaEwe class >> loadEwes [
	"I put the loaded ewes in the ewe manager"
	| man |
	man := self manager.
	OvinaSheepLoader default loadEwes  
		do: [ :ewe | man add: ewe at: ewe eweID ].
]

{ #category : #accessing }
OvinaEwe >> chr [
	^ chr
]

{ #category : #accessing }
OvinaEwe >> chr: anInteger [ 
	chr := anInteger
]

{ #category : #accessing }
OvinaEwe >> eweID [
	^ eweID
]

{ #category : #accessing }
OvinaEwe >> eweID: anObject [
	eweID := anObject
]

{ #category : #accessing }
OvinaEwe >> inDate [
	^ inDate
]

{ #category : #accessing }
OvinaEwe >> inDate: anObject [
	inDate := anObject
]

{ #category : #accessing }
OvinaEwe >> name [
	^ name
]

{ #category : #accessing }
OvinaEwe >> name: anObject [
	name := anObject
]

{ #category : #accessing }
OvinaEwe >> number [
	^ number
]

{ #category : #accessing }
OvinaEwe >> number: anObject [
	number := anObject
]

{ #category : #accessing }
OvinaEwe >> outDate [
	^ outDate
]

{ #category : #accessing }
OvinaEwe >> outDate: anObject [
	outDate := anObject
]

{ #category : #accessing }
OvinaEwe >> race [
	^ race
]

{ #category : #accessing }
OvinaEwe >> race: anObject [
	race := anObject
]
