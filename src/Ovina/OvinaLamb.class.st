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
		'number',
		'momFK',
		'dadFK',
		'inDate',
		'event',
		'sex',
		'growth',
		'usage',
		'color',
		'comment',
		'id'
	],
	#category : #'Ovina-Model'
}

{ #category : #filtering }
OvinaLamb class >> allOfMother: ewe [
	"return only lambs of ewe"
	^ (ewe isNoSheep )
		ifTrue: [ self all ]
		ifFalse: [ self all select: [:lamb | lamb mother = ewe] ]
]

{ #category : #filtering }
OvinaLamb class >> filterCurrent [
	"return only current animals"
	<filter: 'aktuelle'>
	^[:lamb | lamb outDate isNil]
]

{ #category : #private }
OvinaLamb class >> loadEntities [ 
	entities := OvinaEntityLoader default loadLambs 
]

{ #category : #'instance manager' }
OvinaLamb class >> noLamb [
	"Dummy field values for initial presentation of lamb"

	| noLamb |
	noLamb := self new.
	noLamb
		number: 'Nummer';
		momFK: 'Mor';
		dadFK: 'Far';
		inDate: 'Født';
		event: 'Fødsel';
		sex: 'Køn';
		growth: '---';
		usage: 'Anvendelse';
		color: 'Farve';
		comment: 'Kommentar'.
	^ noLamb
]

{ #category : #accessing }
OvinaLamb >> chr [
	<column: 'CHR'>

	^ 112633
]

{ #category : #accessing }
OvinaLamb >> color [
	<column: 'Farve'>
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

{ #category : #public }
OvinaLamb >> dad [
	^ OvinaRam  at: dadFK
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
	<column: 'Fødsel'>
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
OvinaLamb >> id [
	^ id
]

{ #category : #accessing }
OvinaLamb >> id: anObject [
	id := anObject
]

{ #category : #accessing }
OvinaLamb >> inDate [
	<column: 'Født'>
	^ inDate
]

{ #category : #accessing }
OvinaLamb >> inDate: anObject [
	inDate := anObject
]

{ #category : #public }
OvinaLamb >> lastGrowthPrognosis [
	| weights secondLastWeight secondLastDate lastWeight lastDate deltaDay deltaWeight gramPerDay |
	weights := (self events 
					select: [ :ev |  ev description descTag = 'Veje lam' ]) 
				ifEmpty: [ ^self growth  ].
	secondLastWeight := 5.0.
	secondLastDate := self inDate .
	weights size > 1
		ifTrue: [ 
			secondLastWeight := weights nextToLast value asNumber.
			secondLastDate := weights nextToLast eventDate
			 ].
	lastWeight := weights last value asNumber.
	lastDate := weights last eventDate.
	deltaDay := (lastDate - secondLastDate) asDays.
	deltaWeight := lastWeight - secondLastWeight.
	gramPerDay := deltaWeight * 1000 / deltaDay.
	^gramPerDay

]

{ #category : #accessing }
OvinaLamb >> momFK [
	^ momFK
]

{ #category : #accessing }
OvinaLamb >> momFK: anObject [
	momFK := anObject
]

{ #category : #public }
OvinaLamb >> mother [
	^OvinaEwe  at: (momFK)
]

{ #category : #accessing }
OvinaLamb >> number [
	<column: 'Nummer'>
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
	<column: 'Køn'>
	^ sex
]

{ #category : #accessing }
OvinaLamb >> sex: anObject [
	sex := anObject
]

{ #category : #accessing }
OvinaLamb >> usage [
	<column: 'Brug'>
	^ usage
]

{ #category : #accessing }
OvinaLamb >> usage: anObject [
	usage := anObject
]
