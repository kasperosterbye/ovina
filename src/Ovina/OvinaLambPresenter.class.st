"
I present a list of lambs, and a details on the specific lamb
"
Class {
	#name : #OvinaLambPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'numberPresenter',
		'momFKPresenter',
		'dadFKPresenter',
		'inDatePresenter',
		'eventPresenter',
		'sexPresenter',
		'usagePresenter',
		'colorPresenter',
		'commentPresenter',
		'lamb',
		'lambChangedBlock'
	],
	#category : #'Ovina-GUI'
}

{ #category : #specs }
OvinaLambPresenter class >> defaultSpec [
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
OvinaLambPresenter >> colorPresenter [
	^ colorPresenter
]

{ #category : #accessing }
OvinaLambPresenter >> colorPresenter: anObject [
	colorPresenter := anObject
]

{ #category : #accessing }
OvinaLambPresenter >> commentPresenter [
	^ commentPresenter
]

{ #category : #accessing }
OvinaLambPresenter >> commentPresenter: anObject [
	commentPresenter := anObject
]

{ #category : #accessing }
OvinaLambPresenter >> dadFKPresenter [
	^ dadFKPresenter
]

{ #category : #accessing }
OvinaLambPresenter >> dadFKPresenter: anObject [
	dadFKPresenter := anObject
]

{ #category : #accessing }
OvinaLambPresenter >> eventPresenter [
	^ eventPresenter
]

{ #category : #accessing }
OvinaLambPresenter >> eventPresenter: anObject [
	eventPresenter := anObject
]

{ #category : #accessing }
OvinaLambPresenter >> inDatePresenter [
	^ inDatePresenter
]

{ #category : #accessing }
OvinaLambPresenter >> inDatePresenter: anObject [
	inDatePresenter := anObject
]

{ #category : #initialization }
OvinaLambPresenter >> initializePresenter [ 

numberPresenter textPresenter
		acceptBlock: [ :value | 
			lamb number: value.
			lambChangedBlock value: lamb ].
momFKPresenter textPresenter
		acceptBlock: [ :value | 
			lamb momFK: value.
			lambChangedBlock value: lamb ].
dadFKPresenter textPresenter
		acceptBlock: [ :value | 
			lamb dadFK: value.
			lambChangedBlock value: lamb ].
inDatePresenter textPresenter
		acceptBlock: [ :value | 
			lamb inDate: value.
			lambChangedBlock value: lamb ].
eventPresenter textPresenter
		acceptBlock: [ :value | 
			lamb event: value.
			lambChangedBlock value: lamb ].
sexPresenter textPresenter
		acceptBlock: [ :value | 
			lamb sex: value.
			lambChangedBlock value: lamb ].
usagePresenter textPresenter
		acceptBlock: [ :value | 
			lamb usage: value.
			lambChangedBlock value: lamb ].
colorPresenter textPresenter
		acceptBlock: [ :value | 
			lamb color: value.
			lambChangedBlock value: lamb ].
commentPresenter textPresenter
		acceptBlock: [ :value | 
			lamb comment: value.
			lambChangedBlock value: lamb ]
]

{ #category : #initialization }
OvinaLambPresenter >> initializeWidgets [
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
	lamb := OvinaLamb noLamb.
	numberPresenter label: 'Nummer' text: lamb number.
	momFKPresenter label: 'Mor nummer' text: lamb momFK.
	dadFKPresenter label: 'Far nummer' text: lamb dadFK.
	inDatePresenter label: 'Ind dato' text: lamb inDate.
	eventPresenter label: 'Fødsel' text: lamb event.
	sexPresenter label: 'Køn' text: lamb sex.
	usagePresenter label: 'Anvendelse' text: lamb usage.
	colorPresenter label: 'Farve' text: lamb color.
	commentPresenter label: 'Kommentar' text: lamb comment
]

{ #category : #accessing }
OvinaLambPresenter >> lamb [
	^ lamb
]

{ #category : #accessing }
OvinaLambPresenter >> lamb: anObject [
	lamb := anObject
]

{ #category : #accessing }
OvinaLambPresenter >> lambChangedBlock [
	^ lambChangedBlock
]

{ #category : #accessing }
OvinaLambPresenter >> lambChangedBlock: anObject [
	lambChangedBlock := anObject
]

{ #category : #accessing }
OvinaLambPresenter >> momFKPresenter [
	^ momFKPresenter
]

{ #category : #accessing }
OvinaLambPresenter >> momFKPresenter: anObject [
	momFKPresenter := anObject
]

{ #category : #accessing }
OvinaLambPresenter >> numberPresenter [
	^ numberPresenter
]

{ #category : #accessing }
OvinaLambPresenter >> numberPresenter: anObject [
	numberPresenter := anObject
]

{ #category : #accessing }
OvinaLambPresenter >> sexPresenter [
	^ sexPresenter
]

{ #category : #accessing }
OvinaLambPresenter >> sexPresenter: anObject [
	sexPresenter := anObject
]

{ #category : #accessing }
OvinaLambPresenter >> usagePresenter [
	^ usagePresenter
]

{ #category : #accessing }
OvinaLambPresenter >> usagePresenter: anObject [
	usagePresenter := anObject
]
