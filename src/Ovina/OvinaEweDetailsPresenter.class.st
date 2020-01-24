"
I present details on a specfici ewe
"
Class {
	#name : #OvinaEweDetailsPresenter,
	#superclass : #OvinaSheepDetailsPresenter,
	#instVars : [
		'namePresenter',
		'chrPresenter',
		'numberPresenter',
		'inDatePresenter',
		'racePresenter',
		'outDatePresenter'
	],
	#category : #'Ovina-GUI-SheepLists'
}

{ #category : #specs }
OvinaEweDetailsPresenter class >> defaultSpec [
	| height |
	height := OvinaLabeledInputField height.
	^ SpBoxLayout newVertical
		add: ( SpBoxLayout newHorizontal 
					add: #namePresenter;
					add: #chrPresenter;
					add: #numberPresenter);
		add: ( SpBoxLayout newHorizontal 
					add: #inDatePresenter;
					add: #racePresenter;
					add: #outDatePresenter)
]

{ #category : #accessing }
OvinaEweDetailsPresenter >> chrPresenter [
	^ chrPresenter
]

{ #category : #accessing }
OvinaEweDetailsPresenter >> chrPresenter: anObject [
	chrPresenter := anObject
]

{ #category : #accessing }
OvinaEweDetailsPresenter >> inDatePresenter [
	^ inDatePresenter
]

{ #category : #accessing }
OvinaEweDetailsPresenter >> inDatePresenter: anObject [
	inDatePresenter := anObject
]

{ #category : #initialization }
OvinaEweDetailsPresenter >> initializePresenter [
	namePresenter textPresenter
		acceptBlock: [ :value | 
			sheep name: value.
			sheepChangedBlock value: sheep ].
	chrPresenter textPresenter
		acceptBlock: [ :value | 
			sheep chr: value.
			sheepChangedBlock value: sheep ].
	numberPresenter textPresenter
		acceptBlock: [ :value | 
			sheep number: value.
			sheepChangedBlock value: sheep ].
	inDatePresenter textPresenter
		acceptBlock: [ :value | 
			sheep inDate: value.
			sheepChangedBlock value: sheep ].
	racePresenter textPresenter
		acceptBlock: [ :value | 
			sheep race: value.
			sheepChangedBlock value: sheep ].
	outDatePresenter textPresenter
		acceptBlock: [ :value | 
			sheep outDate: value.
			sheepChangedBlock value: sheep ]
]

{ #category : #initialization }
OvinaEweDetailsPresenter >> initializeWidgets [
	namePresenter := self instantiate: OvinaLabeledInputField.
	chrPresenter := self instantiate: OvinaLabeledInputField.
	numberPresenter := self instantiate: OvinaLabeledInputField.
	inDatePresenter := self instantiate: OvinaLabeledInputField.
	racePresenter := self instantiate: OvinaLabeledInputField.
	outDatePresenter := self instantiate: OvinaLabeledInputField.
	sheep := OvinaEwe noEwe.
	namePresenter label: 'Navn' text: sheep name.
	chrPresenter label: 'CHR' text: sheep chr.
	numberPresenter label: 'Nummer' text: sheep number.
	inDatePresenter label: 'Ind dato' text: sheep inDate.
	racePresenter label: 'Race' text: sheep race.
	outDatePresenter label: 'Ud dato' text: sheep outDate
]

{ #category : #accessing }
OvinaEweDetailsPresenter >> namePresenter [
	^ namePresenter
]

{ #category : #accessing }
OvinaEweDetailsPresenter >> namePresenter: anObject [
	namePresenter := anObject
]

{ #category : #accessing }
OvinaEweDetailsPresenter >> numberPresenter [
	^ numberPresenter
]

{ #category : #accessing }
OvinaEweDetailsPresenter >> numberPresenter: anObject [
	numberPresenter := anObject
]

{ #category : #accessing }
OvinaEweDetailsPresenter >> outDatePresenter [
	^ outDatePresenter
]

{ #category : #accessing }
OvinaEweDetailsPresenter >> outDatePresenter: anObject [
	outDatePresenter := anObject
]

{ #category : #accessing }
OvinaEweDetailsPresenter >> racePresenter [
	^ racePresenter
]

{ #category : #accessing }
OvinaEweDetailsPresenter >> racePresenter: anObject [
	racePresenter := anObject
]

{ #category : #accessing }
OvinaEweDetailsPresenter >> sheep: newsheep [
	super sheep: newsheep.
	namePresenter text: sheep name.
	chrPresenter text: sheep chr.
	numberPresenter text: sheep number.
	inDatePresenter text: sheep inDate.
	racePresenter text: sheep race.
	outDatePresenter text: sheep outDate
]
