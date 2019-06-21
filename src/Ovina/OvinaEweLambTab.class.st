"
I am the primary tab showing ewes and lambs
"
Class {
	#name : #OvinaEweLambTab,
	#superclass : #ComposablePresenter,
	#instVars : [
		'ewesPresenter',
		'lambsPresenter'
	],
	#category : #'Ovina-GUI'
}

{ #category : #specs }
OvinaEweLambTab class >> defaultSpec [
	^SpecLayout composed
		newRow: [ :row | 
			row
				add: #ewesPresenter;
				add: #lambsPresenter ]
]

{ #category : #'as yet unclassified' }
OvinaEweLambTab >> ewesPresenter [
	^ ewesPresenter
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
