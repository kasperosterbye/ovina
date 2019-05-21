"
I present a list of rams, and a details on the specific ram
"
Class {
	#name : #OvinaRamPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'namePresenter',
		'chrPresenter',
		'numberPresenter',
		'inDatePresenter',
		'racePresenter',
		'ram',
		'ramChangedBlock'
	],
	#category : #'Ovina-GUI'
}

{ #category : #specs }
OvinaRamPresenter class >> defaultSpec [
	| height |
	height := OvinaLabeledInputField height.
	^ SpecLayout composed
		newRow: [ :row | row add: #namePresenter; add: #chrPresenter; add: #numberPresenter  ]
		origin: 0@0 corner: 1@0 offsetOrigin: 0@0 offsetCorner: 0@height;
		newRow: [ :row | row add: #inDatePresenter; add: #racePresenter ]
		origin: 0@0 corner: 1@0 offsetOrigin: 0@height offsetCorner: 0@(height *2 );
		yourself
]

{ #category : #example }
OvinaRamPresenter class >> example [ 

(self on: (OvinaRam csvContents upToEnd at: 1)) openWithSpec
]

{ #category : #'instance creation' }
OvinaRamPresenter class >> on: aRam [
	"(OvinaRamPresenter on: (OvinaRam csvContents upToEnd at: 1)) openWithSpec"
	^self basicNew 
		ram: aRam; 
		initialize ; 
		yourself
]

{ #category : #specs }
OvinaRamPresenter class >> title [ 
	^'Ram'
]

{ #category : #accessing }
OvinaRamPresenter >> chrPresenter [
	^ chrPresenter
]

{ #category : #accessing }
OvinaRamPresenter >> chrPresenter: anObject [
	chrPresenter := anObject
]

{ #category : #accessing }
OvinaRamPresenter >> inDatePresenter [
	^ inDatePresenter
]

{ #category : #accessing }
OvinaRamPresenter >> inDatePresenter: anObject [
	inDatePresenter := anObject
]

{ #category : #initialization }
OvinaRamPresenter >> initializePresenter [
	namePresenter textPresenter acceptBlock:  [ :value | ram name: value. ramChangedBlock value: ram ].
	chrPresenter textPresenter acceptBlock:  [ :value | ram chr: value asInteger. ramChangedBlock value: ram ].
	numberPresenter textPresenter acceptBlock:  [ :value | ram number: value. ramChangedBlock value: ram ].
	inDatePresenter textPresenter acceptBlock:  [ :value | ram inDate: value asDate. ramChangedBlock value: ram ].
	racePresenter textPresenter acceptBlock:  [ :value | ram race: value. ramChangedBlock value: ram].
]

{ #category : #initialization }
OvinaRamPresenter >> initializeWidgets [
	"instantiation"
	namePresenter := self instantiate: OvinaLabeledInputField.
	chrPresenter := self instantiate: OvinaLabeledInputField.
	numberPresenter := self instantiate: OvinaLabeledInputField.
	inDatePresenter := self instantiate: OvinaLabeledInputField.
	racePresenter := self instantiate: OvinaLabeledInputField.
	"configuration"
	ram := OvinaRam noRam.
	namePresenter label: 'Name' text: ram name.
	chrPresenter label: 'Chr No' text: ram chr.
	numberPresenter label: 'Number' text: ram number.
	inDatePresenter label: 'In date' text: ram inDate.
	racePresenter label: 'Race' text: ram race.
	
]

{ #category : #accessing }
OvinaRamPresenter >> namePresenter [

	^ namePresenter
]

{ #category : #accessing }
OvinaRamPresenter >> namePresenter: anObject [
	namePresenter := anObject
]

{ #category : #accessing }
OvinaRamPresenter >> numberPresenter [
	^ numberPresenter
]

{ #category : #accessing }
OvinaRamPresenter >> numberPresenter: anObject [
	numberPresenter := anObject
]

{ #category : #accessing }
OvinaRamPresenter >> racePresenter [
	^ racePresenter
]

{ #category : #accessing }
OvinaRamPresenter >> racePresenter: anObject [
	racePresenter := anObject
]

{ #category : #accessing }
OvinaRamPresenter >> ram [
	^ ram
]

{ #category : #accessing }
OvinaRamPresenter >> ram: newRam [
	ram := newRam.
	namePresenter text: ram name.
	chrPresenter text: ram chr.
	numberPresenter text: ram number.
	inDatePresenter text: ram inDate.
	racePresenter text: ram race
]

{ #category : #accessing }
OvinaRamPresenter >> ramChanged: aBlock [
	"execute a block when one of the fields of the ram has changed. The ram is given as argument to the block"

	ramChangedBlock := aBlock
]
