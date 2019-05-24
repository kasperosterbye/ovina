"
I represent an ewe
"
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

{ #category : #'as yet unclassified' }
OvinaEwe class >> noEwe [
	| noEwe |
	noEwe := self new.
	noEwe
		eweID: 'ID';
		name: 'Navn';
		chr: 'CHR';
		number: 'Nummer';
		inDate: 'Ind dato';
		race: 'Race';
		outDate: 'Ud dato'.
	^ noEwe
]

{ #category : #accessing }
OvinaEwe >> chr [
	<column: 'CHR'>
	^ chr
]

{ #category : #accessing }
OvinaEwe >> chr: anInteger [ 
	chr := anInteger
]

{ #category : #accessing }
OvinaEwe >> eweID [
	<column: 'ID'>
	^ eweID
]

{ #category : #accessing }
OvinaEwe >> eweID: anObject [
	eweID := anObject
]

{ #category : #accessing }
OvinaEwe >> inDate [
	<column: 'Ind dato'>
	^ inDate
]

{ #category : #accessing }
OvinaEwe >> inDate: anObject [
	inDate := anObject
]

{ #category : #accessing }
OvinaEwe >> name [
	<column: 'Navn'>
	^ name
]

{ #category : #accessing }
OvinaEwe >> name: anObject [
	name := anObject
]

{ #category : #accessing }
OvinaEwe >> number [
	<column: 'Nummer'>
	^ number
]

{ #category : #accessing }
OvinaEwe >> number: anObject [
	number := anObject
]

{ #category : #accessing }
OvinaEwe >> outDate [
	<column: 'Ud dato'>
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
