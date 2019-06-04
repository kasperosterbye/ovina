"
I represent an Ovina Ram. 

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.
I can read rams from a CSV file, write them to a file, and can open a TreePresenter. 

 
Internal Representation and Key Implementation Points.

    Instance Variables
	chr:		<Integer >
	inDate:		<Date>
	name:		<String>
	number:		<Integer>
	race:		<String>
	ramId:		<Integer>


"
Class {
	#name : #OvinaRam,
	#superclass : #OvinaSheep,
	#instVars : [
		'name',
		'chr',
		'number',
		'inDate',
		'race',
		'id'
	],
	#category : #'Ovina-Model'
}

{ #category : #accessing }
OvinaRam class >> loadSelector [
	^ #loadRams
]

{ #category : #'instance creation' }
OvinaRam class >> noRam [
	| noRam |
	noRam := self new.
	noRam
		ramId: 'ID';
		name: 'Navn';
		chr: 'CHR';
		number: 'Nummer';
		inDate: 'Ind dato';
		race: 'Race'.
	^ noRam
]

{ #category : #accessing }
OvinaRam >> chr [
	<column: 'CHR'>
	^ chr
]

{ #category : #accessing }
OvinaRam >> chr: anObject [
	chr := anObject
]

{ #category : #accessing }
OvinaRam >> id [
	^ id
]

{ #category : #accessing }
OvinaRam >> id: anObject [
	id := anObject
]

{ #category : #accessing }
OvinaRam >> inDate [
	^ inDate
]

{ #category : #accessing }
OvinaRam >> inDate: anObject [
	inDate := anObject
]

{ #category : #accessing }
OvinaRam >> name [
	<column: 'Navn'>
	^ name
]

{ #category : #accessing }
OvinaRam >> name: anObject [
	name := anObject
]

{ #category : #accessing }
OvinaRam >> number [
	<column: 'Nummer'>
	^ number
]

{ #category : #accessing }
OvinaRam >> number: anObject [
	number := anObject
]

{ #category : #'ui building' }
OvinaRam >> open [
	| tree |
	tree := TreePresenter new.
	tree beCheckList.
	tree multiSelection: true.
	tree
		columns: (self headers collect: [ :colName | self columnPresenterFor: colName ]).
	tree roots: self class csvContents upToEnd.
	tree openWithSpec
]

{ #category : #printing }
OvinaRam >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream nextPutAll: '{ '.
	aStream
		nextPutAll: ' ramId: ';
		print: id.
	aStream
		nextPutAll: ' name: ';
		print: name.
	aStream
		nextPutAll: ' number: ';
		print: number.
	aStream
		nextPutAll: ' race: ';
		print: race.
	aStream nextPutAll: ' }'.
	
]

{ #category : #accessing }
OvinaRam >> race [
	<column: 'Race'>
	^ race
]

{ #category : #accessing }
OvinaRam >> race: anObject [
	race := anObject
]

{ #category : #'accessing-computed' }
OvinaRam >> raceNavn [
	<column: 'Navn(race)'>
	^ name , '(',(race select: [ :char | char isUppercase ]),')'.
]
