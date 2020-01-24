"
I present details on a specific ram
"
Class {
	#name : #OvinaRamDetailsPresenter,
	#superclass : #OvinaSheepDetailsPresenter,
	#instVars : [
		'namePresenter',
		'chrPresenter',
		'numberPresenter',
		'inDatePresenter',
		'racePresenter'
	],
	#category : #'Ovina-GUI-SheepLists'
}

{ #category : #specs }
OvinaRamDetailsPresenter class >> defaultSpec [
	| height |
	height := OvinaLabeledInputField height.
	^ SpBoxLayout newVertical
		newRow: [ :row | row add: #namePresenter; add: #chrPresenter; add: #numberPresenter  ]
		origin: 0@0 corner: 1@0 offsetOrigin: 0@0 offsetCorner: 0@height;
		newRow: [ :row | row add: #inDatePresenter; add: #racePresenter ]
		origin: 0@0 corner: 1@0 offsetOrigin: 0@height offsetCorner: 0@(height *2 );
		yourself
]

{ #category : #example }
OvinaRamDetailsPresenter class >> example [ 

(self on: (OvinaRam csvContents upToEnd at: 1)) openWithSpec
]

{ #category : #'instance creation' }
OvinaRamDetailsPresenter class >> on: aRam [
	"(OvinaRamPresenter on: (OvinaRam csvContents upToEnd at: 1)) openWithSpec"
	^self basicNew 
		ram: aRam; 
		initialize ; 
		yourself
]

{ #category : #specs }
OvinaRamDetailsPresenter class >> title [ 
	^'Ram'
]

{ #category : #accessing }
OvinaRamDetailsPresenter >> chrPresenter [
	^ chrPresenter
]

{ #category : #accessing }
OvinaRamDetailsPresenter >> chrPresenter: anObject [
	chrPresenter := anObject
]

{ #category : #accessing }
OvinaRamDetailsPresenter >> inDatePresenter [
	^ inDatePresenter
]

{ #category : #accessing }
OvinaRamDetailsPresenter >> inDatePresenter: anObject [
	inDatePresenter := anObject
]

{ #category : #initialization }
OvinaRamDetailsPresenter >> initializePresenter [
	namePresenter textPresenter
		acceptBlock: [ :value | 
			sheep name: value.
			sheepChangedBlock value: sheep ].
	chrPresenter textPresenter
		acceptBlock: [ :value | 
			sheep chr: value asInteger.
			sheepChangedBlock value: sheep ].
	numberPresenter textPresenter
		acceptBlock: [ :value | 
			sheep number: value.
			sheepChangedBlock value: sheep ].
	inDatePresenter textPresenter
		acceptBlock: [ :value | 
			sheep inDate: value asDate.
			sheepChangedBlock value: sheep ].
	racePresenter textPresenter
		acceptBlock: [ :value | 
			sheep race: value.
			sheepChangedBlock value: sheep ]
]

{ #category : #initialization }
OvinaRamDetailsPresenter >> initializeWidgets [
	"instantiation"

	namePresenter := self instantiate: OvinaLabeledInputField.
	chrPresenter := self instantiate: OvinaLabeledInputField.
	numberPresenter := self instantiate: OvinaLabeledInputField.
	inDatePresenter := self instantiate: OvinaLabeledInputField.
	racePresenter := self instantiate: OvinaLabeledInputField.
	"configuration"
	sheep := OvinaRam noRam.
	namePresenter label: 'Name' text: sheep name.
	chrPresenter label: 'Chr No' text: sheep chr.
	numberPresenter label: 'Number' text: sheep number.
	inDatePresenter label: 'In date' text: sheep inDate.
	racePresenter label: 'Race' text: sheep race
]

{ #category : #accessing }
OvinaRamDetailsPresenter >> namePresenter [

	^ namePresenter
]

{ #category : #accessing }
OvinaRamDetailsPresenter >> namePresenter: anObject [
	namePresenter := anObject
]

{ #category : #accessing }
OvinaRamDetailsPresenter >> numberPresenter [
	^ numberPresenter
]

{ #category : #accessing }
OvinaRamDetailsPresenter >> numberPresenter: anObject [
	numberPresenter := anObject
]

{ #category : #accessing }
OvinaRamDetailsPresenter >> racePresenter [
	^ racePresenter
]

{ #category : #accessing }
OvinaRamDetailsPresenter >> racePresenter: anObject [
	racePresenter := anObject
]

{ #category : #accessing }
OvinaRamDetailsPresenter >> sheep: newsheep [
	super sheep: newsheep.
	namePresenter text: sheep name.
	chrPresenter text: sheep chr.
	numberPresenter text: sheep number.
	inDatePresenter text: sheep inDate.
	racePresenter text: sheep race
]
