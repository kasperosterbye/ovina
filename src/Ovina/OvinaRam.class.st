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
		'ramId',
		'name',
		'chr',
		'number',
		'inDate',
		'race'
	],
	#category : #Ovina
}

{ #category : #'instance manager' }
OvinaRam class >> allRams [
	^self csvContents upToEnd
]

{ #category : #'instance manager' }
OvinaRam class >> csvContents [
	| neoReader |
	neoReader := NeoCSVReader on: (self fileContents ).
	"'ramID' 'name' 'chr' 'number' 'inDate' 'race'"
	neoReader 
		separator: $; ;
		recordClass: self;
		addIntegerField: #ramId:;
		addField: #name:;
		addIntegerField: #chr:;
		addIntegerField: #number:;
		addField: #inDate: converter: [ :s | Date  fromString: s]	;
		addField: #race:;
		skipHeader.
	^neoReader.
]

{ #category : #'instance manager' }
OvinaRam class >> fileContents [
	"comment stating purpose of message"

	^'/Users/kasper/_Projects/Pharo/ovina_csv/rams.csv' asFileReference readStream
]

{ #category : #'instance manager' }
OvinaRam class >> loadRams [
	manager := OvinaSheepManager new.
	self csvContents do: [ :ram | manager add: ram at: ram ramId]
	
	
]

{ #category : #'instance manager' }
OvinaRam class >> noRam [
	| noRam | 
	noRam := OvinaRam new.
	noRam 
		ramId: 'ID';
		name: 'Navn';
		chr: 'CHR';
		number: 'Nummer';
		inDate: 'Ind dato';
		race: 'Race'.
	^noRam
		
]

{ #category : #'ui building' }
OvinaRam class >> openDemo [
"self class "
	| tree |
tree := TreePresenter new.

tree columns: (Array 
	with: (TreeColumnPresenter  new displayBlock: [:node | node content first asString ]; headerLabel: 'Name'; yourself)
	with: (TreeColumnPresenter new displayBlock: [:node | node content second asString ]; headerLabel: 'Last Name'; yourself)
	with: (TreeColumnPresenter new displayBlock: [:node | node content third asString ]; headerLabel: 'Age'; yourself)
	with: (TreeColumnPresenter new displayBlock: [:node | node content fourth asString ]; headerLabel: 'Gender'; yourself)).
	
tree roots: {
	{'Benjamin'.'Van Ryseghem'.'26'.'M'}.
	{'Pamela'.'Anderson'.'Far too much'.'F'}
}.

tree openWithSpec.
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
		print: ramId.
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

{ #category : #accessing }
OvinaRam >> ramId [
	^ ramId
]

{ #category : #accessing }
OvinaRam >> ramId: anObject [
	ramId := anObject
]
