"
I represent an ewe
"
Class {
	#name : #OvinaEwe,
	#superclass : #OvinaSheep,
	#instVars : [
		'name',
		'chr',
		'number',
		'inDate',
		'race',
		'outDate',
		'id'
	],
	#category : #'Ovina-Model'
}

{ #category : #private }
OvinaEwe class >> loadEntities [ 
	entities := OvinaEntityLoader default loadEwes 
]

{ #category : #'instance manager' }
OvinaEwe class >> noEwe [
	| noEwe |
	noEwe := self new.
	noEwe
		id: 'ID';
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
OvinaEwe >> id [
	^ id
]

{ #category : #accessing }
OvinaEwe >> id: anObject [
	id := anObject
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

{ #category : #public }
OvinaEwe >> offspring [
	^ OvinaLamb  all select: [ :lamb | lamb momFK = id]
]

{ #category : #accessing }
OvinaEwe >> outDate [
	<column: 'Ud dato'>
	^ outDate ifNil: [ '' ]
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
