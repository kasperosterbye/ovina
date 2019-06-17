Class {
	#name : #OvinaEventDescriptionDetailsPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'desc',
		'descChangedBlock',
		'descTagPresenter',
		'descDatePresenter',
		'descCommentPresenter'
	],
	#category : #'Ovina-GUI'
}

{ #category : #specs }
OvinaEventDescriptionDetailsPresenter class >> defaultSpec [
	| height |
	height := OvinaLabeledInputField height.
	"descTagPresenter descDatePresenter descCommentPresenter"
	^ SpecLayout composed
		newRow: [ :row | 
				row
					add: #descTagPresenter;
					add: #descDatePresenter ]
			origin: 0 @ 0
			corner: 1 @ 0
			offsetOrigin: 0 @ 0
			offsetCorner: 0 @ height;
		newRow: [ :row | row add: #descCommentPresenter ]
			origin: 0 @ 0
			corner: 1 @ 0
			offsetOrigin: 0 @ height
			offsetCorner: 0 @ (height * 3);
		yourself
]

{ #category : #accessing }
OvinaEventDescriptionDetailsPresenter >> desc [
	^ desc
]

{ #category : #accessing }
OvinaEventDescriptionDetailsPresenter >> desc: newDesc [
	descTagPresenter text: desc descTag.
	descDatePresenter text: desc descDate.
	descCommentPresenter text: desc descComment
]

{ #category : #accessing }
OvinaEventDescriptionDetailsPresenter >> descChangedBlock [
	^ descChangedBlock
]

{ #category : #accessing }
OvinaEventDescriptionDetailsPresenter >> descChangedBlock: anObject [
	descChangedBlock := anObject
]

{ #category : #accessing }
OvinaEventDescriptionDetailsPresenter >> descCommentPresenter [
	^ descCommentPresenter
]

{ #category : #accessing }
OvinaEventDescriptionDetailsPresenter >> descCommentPresenter: anObject [
	descCommentPresenter := anObject
]

{ #category : #accessing }
OvinaEventDescriptionDetailsPresenter >> descDatePresenter [
	^ descDatePresenter
]

{ #category : #accessing }
OvinaEventDescriptionDetailsPresenter >> descDatePresenter: anObject [
	descDatePresenter := anObject
]

{ #category : #accessing }
OvinaEventDescriptionDetailsPresenter >> descTagPresenter [
	^ descTagPresenter
]

{ #category : #accessing }
OvinaEventDescriptionDetailsPresenter >> descTagPresenter: anObject [
	descTagPresenter := anObject
]

{ #category : #initialization }
OvinaEventDescriptionDetailsPresenter >> initializePresenter [ 
descTagPresenter textPresenter
		acceptBlock: [ :value | 
			desc descTag: value.
			descChangedBlock value: desc].
descDatePresenter textPresenter
		acceptBlock: [ :value | 
			desc descDate: value.
			descChangedBlock value: desc].
descCommentPresenter textPresenter
		acceptBlock: [ :value | 
			desc descComment: value.
			descChangedBlock value: desc.]
]

{ #category : #initialization }
OvinaEventDescriptionDetailsPresenter >> initializeWidgets [
	descTagPresenter := self instantiate: OvinaLabeledInputField.
	descDatePresenter := self instantiate: OvinaLabeledInputField.
	descCommentPresenter := self instantiate: OvinaCommentField.
	desc := OvinaEventDescription noEventDescription.
	descTagPresenter label: 'Type' text: desc descTag.
	descDatePresenter label: 'Dato' text: desc descDate.
	descCommentPresenter label: 'Kommentar' text: desc descComment
]
