"
I represent an Ovina Ram. 

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.
I can read rams from a CSV file, write them to a file, and can open a TreePresenter. 

OvinaRam example.
 
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
	#name : #OvinaLamb,
	#superclass : #OvinaSheep,
	#instVars : [
		'lambID',
		'number',
		'momFK',
		'dadFK',
		'inDate',
		'event',
		'sex',
		'growth',
		'usage',
		'color',
		'comment'
	],
	#category : #Ovina
}

{ #category : #'instance manager' }
OvinaLamb class >> csvContents [
	| neoReader |
	neoReader := NeoCSVReader on: (self fileContents ).
	"lambID number momFK dadFK inDate event sex growth usage color comment"
	neoReader 
		separator: $; ;
		recordClass: self;
		addIntegerField: #lambID:;
		addIntegerField: #number:;
		addIntegerField: #momFK:;
		addIntegerField: #dadFK:;
		addField: #inDate: converter: [ :s | Date  fromString: s]	;
		addField: #event:;
		addField: #sex:;
		addIntegerField: #growth:;
		addField: #usage:;
		addField: #color:;
		addField: #comment:;
		skipHeader.
	^neoReader.
]

{ #category : #'instance manager' }
OvinaLamb class >> fileContents [
	"comment stating purpose of message"

	^'/Users/kasper/_Projects/Pharo/ovina_csv/lambs.csv' asFileReference readStream
]

{ #category : #accessing }
OvinaLamb >> chr [
	^ self shouldBeImplemented
]

{ #category : #accessing }
OvinaLamb >> color [
	^ color
]

{ #category : #accessing }
OvinaLamb >> color: anObject [
	color := anObject
]

{ #category : #accessing }
OvinaLamb >> comment [
	^ comment
]

{ #category : #accessing }
OvinaLamb >> comment: anObject [
	comment := anObject
]

{ #category : #accessing }
OvinaLamb >> dadFK [
	^ dadFK
]

{ #category : #accessing }
OvinaLamb >> dadFK: anObject [
	dadFK := anObject
]

{ #category : #accessing }
OvinaLamb >> event [
	^ event
]

{ #category : #accessing }
OvinaLamb >> event: anObject [
	event := anObject
]

{ #category : #accessing }
OvinaLamb >> growth [
	^ growth
]

{ #category : #accessing }
OvinaLamb >> growth: anObject [
	growth := anObject
]

{ #category : #accessing }
OvinaLamb >> inDate [
	^ inDate
]

{ #category : #accessing }
OvinaLamb >> inDate: anObject [
	inDate := anObject
]

{ #category : #accessing }
OvinaLamb >> lambID [
	^ lambID
]

{ #category : #accessing }
OvinaLamb >> lambID: anObject [
	lambID := anObject
]

{ #category : #accessing }
OvinaLamb >> momFK [
	^ momFK
]

{ #category : #accessing }
OvinaLamb >> momFK: anObject [
	momFK := anObject
]

{ #category : #accessing }
OvinaLamb >> number [
	^ number
]

{ #category : #accessing }
OvinaLamb >> number: anObject [
	number := anObject
]

{ #category : #printing }
OvinaLamb >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' number: ';
		print: number
]

{ #category : #accessing }
OvinaLamb >> sex [
	^ sex
]

{ #category : #accessing }
OvinaLamb >> sex: anObject [
	sex := anObject
]

{ #category : #accessing }
OvinaLamb >> usage [
	^ usage
]

{ #category : #accessing }
OvinaLamb >> usage: anObject [
	usage := anObject
]
