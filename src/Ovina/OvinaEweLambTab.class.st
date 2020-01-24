"
I am the primary tab showing ewes and lambs
"
Class {
	#name : #OvinaEweLambTab,
	#superclass : #SpPresenter,
	#instVars : [
		'ewesPresenter',
		'lambsPresenter'
	],
	#category : #'Ovina-GUI'
}

{ #category : #specs }
OvinaEweLambTab class >> defaultSpec [
	^SpBoxLayout newHorizontal
		add: #ewesPresenter;
		add: #lambsPresenter;
		yourself
]

{ #category : #'as yet unclassified' }
OvinaEweLambTab >> ewesPresenter [
	^ ewesPresenter
]

{ #category : #api }
OvinaEweLambTab >> extent [
	^ 800@600
]

{ #category : #'as yet unclassified' }
OvinaEweLambTab >> initializePresenter [
	
	ewesPresenter selectionChangeBlock: [ :ewe | 
		lambsPresenter sheepListPresenter items: (OvinaLamb allOfMother: ewe) .
		].
]

{ #category : #initialization }
OvinaEweLambTab >> initializeWidgets [
	ewesPresenter := self instantiate: OvinaEwePresenter.
	lambsPresenter := self instantiate: OvinaLambPresenter.
	
	ewesPresenter whenBuiltDo: [ :b | b widget borderWidth: 1 ].	
	lambsPresenter whenBuiltDo: [ :b | b widget borderWidth: 1 ].
	
	
]

{ #category : #'as yet unclassified' }
OvinaEweLambTab >> lambsPresenter [
	^ lambsPresenter
]

{ #category : #api }
OvinaEweLambTab >> title [
	^'Får og lam'
]
