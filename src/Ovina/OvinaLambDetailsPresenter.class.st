"
I present details on a specific lamb
"
Class {
	#name : #OvinaLambDetailsPresenter,
	#superclass : #OvinaSheepDetailsPresenter,
	#instVars : [
		'numberPresenter',
		'momFKPresenter',
		'dadFKPresenter',
		'inDatePresenter',
		'eventPresenter',
		'sexPresenter',
		'usagePresenter',
		'colorPresenter',
		'commentPresenter'
	],
	#category : #'Ovina-GUI-SheepLists'
}

{ #category : #specs }
OvinaLambDetailsPresenter class >> defaultSpec [
	"#momFKPresenter #dadFKPresenter #inDatePresenter #eventPresenter #sexPresenter #growthPresenter #usagePresenter #colorPresenter #commentPresente"

	| height |
	height := OvinaLabeledInputField height.
	^ SpecLayout composed
		newRow: [ :row | 
				row
					add: #numberPresenter;
					add: #momFKPresenter;
					add: #dadFKPresenter;
					add: #colorPresenter;
					add: #sexPresenter ]
			origin: 0 @ 0
			corner: 1 @ 0
			offsetOrigin: 0 @ 0
			offsetCorner: 0 @ height;
		newRow: [ :row | 
				row
					add: #inDatePresenter;
					add: #eventPresenter;
					add: #usagePresenter ]
			origin: 0 @ 0
			corner: 1 @ 0
			offsetOrigin: 0 @ height
			offsetCorner: 0 @ (height * 2);
		newRow: [ :row | row add: #commentPresenter ]
			origin: 0 @ 0
			corner: 1 @ 0
			offsetOrigin: 0 @ (height * 2)
			offsetCorner: 0 @ (height * 4);
		yourself
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> colorPresenter [
	^ colorPresenter
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> colorPresenter: anObject [
	colorPresenter := anObject
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> commentPresenter [
	^ commentPresenter
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> commentPresenter: anObject [
	commentPresenter := anObject
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> dadFKPresenter [
	^ dadFKPresenter
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> dadFKPresenter: anObject [
	dadFKPresenter := anObject
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> eventPresenter [
	^ eventPresenter
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> eventPresenter: anObject [
	eventPresenter := anObject
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> inDatePresenter [
	^ inDatePresenter
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> inDatePresenter: anObject [
	inDatePresenter := anObject
]

{ #category : #initialization }
OvinaLambDetailsPresenter >> initializePresenter [
	numberPresenter textPresenter
		acceptBlock: [ :value | 
			sheep number: value.
			sheepChangedBlock value: sheep ].
	momFKPresenter textPresenter
		acceptBlock: [ :value | 
			sheep momFK: value.
			sheepChangedBlock value: sheep ].
	dadFKPresenter textPresenter
		acceptBlock: [ :value | 
			sheep dadFK: value.
			sheepChangedBlock value: sheep ].
	inDatePresenter textPresenter
		acceptBlock: [ :value | 
			sheep inDate: value.
			sheepChangedBlock value: sheep ].
	eventPresenter textPresenter
		acceptBlock: [ :value | 
			sheep event: value.
			sheepChangedBlock value: sheep ].
	sexPresenter textPresenter
		acceptBlock: [ :value | 
			sheep sex: value.
			sheepChangedBlock value: sheep ].
	usagePresenter textPresenter
		acceptBlock: [ :value | 
			sheep usage: value.
			sheepChangedBlock value: sheep ].
	colorPresenter textPresenter
		acceptBlock: [ :value | 
			sheep color: value.
			sheepChangedBlock value: sheep ].
	commentPresenter textPresenter
		acceptBlock: [ :value | 
			sheep comment: value.
			sheepChangedBlock value: sheep ]
]

{ #category : #initialization }
OvinaLambDetailsPresenter >> initializeWidgets [
	"instantiation"

	numberPresenter := self instantiate: OvinaLabeledInputField.
	momFKPresenter := self instantiate: OvinaLabeledInputField.
	dadFKPresenter := self instantiate: OvinaLabeledInputField.
	inDatePresenter := self instantiate: OvinaLabeledInputField.
	eventPresenter := self instantiate: OvinaLabeledInputField.
	sexPresenter := self instantiate: OvinaLabeledInputField.
	usagePresenter := self instantiate: OvinaLabeledInputField.
	colorPresenter := self instantiate: OvinaLabeledInputField.
	commentPresenter := self instantiate: OvinaCommentField.
	"configuration"
	sheep := OvinaLamb noLamb.
	numberPresenter label: 'Nummer' text: sheep number.
	momFKPresenter label: 'Mor nummer' text: sheep momFK.
	dadFKPresenter label: 'Far nummer' text: sheep dadFK.
	inDatePresenter label: 'Ind dato' text: sheep inDate.
	eventPresenter label: 'Fødsel' text: sheep event.
	sexPresenter label: 'Køn' text: sheep sex.
	usagePresenter label: 'Anvendelse' text: sheep usage.
	colorPresenter label: 'Farve' text: sheep color.
	commentPresenter label: 'Kommentar' text: sheep comment
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> momFKPresenter [
	^ momFKPresenter
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> momFKPresenter: anObject [
	momFKPresenter := anObject
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> numberPresenter [
	^ numberPresenter
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> numberPresenter: anObject [
	numberPresenter := anObject
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> sexPresenter [
	^ sexPresenter
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> sexPresenter: anObject [
	sexPresenter := anObject
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> sheep: newsheep [
	super sheep: newsheep.
	numberPresenter text: sheep number.
	momFKPresenter text: sheep momFK.
	dadFKPresenter text: sheep dadFK.
	inDatePresenter text: sheep inDate.
	eventPresenter text: sheep event.
	sexPresenter text: sheep sex.
	usagePresenter text: sheep usage.
	colorPresenter text: sheep color.
	commentPresenter  text: sheep comment
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> usagePresenter [
	^ usagePresenter
]

{ #category : #accessing }
OvinaLambDetailsPresenter >> usagePresenter: anObject [
	usagePresenter := anObject
]
