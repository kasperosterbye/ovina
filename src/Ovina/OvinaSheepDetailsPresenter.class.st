"
I represent a presentation of a single sheep.

The exact composition of my layout depends on the kind of my sheeps (Ram, Ewe or Lamb)
"
Class {
	#name : #OvinaSheepDetailsPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'sheep',
		'sheepChangedBlock'
	],
	#category : #'Ovina-GUI-SheepLists'
}

{ #category : #'as yet unclassified' }
OvinaSheepDetailsPresenter class >> instVarNamesFor: ovinaType [
	^ ' ' join: (ovinaType instVarNames collect: [ :iv | iv , 'Presenter' ])
]

{ #category : #initialization }
OvinaSheepDetailsPresenter >> initializeWidgets [
	self subclassResponsibility 
]

{ #category : #accessing }
OvinaSheepDetailsPresenter >> sheep [
	^ sheep
]

{ #category : #accessing }
OvinaSheepDetailsPresenter >> sheep: aSheep [
	sheep := aSheep
]

{ #category : #accessing }
OvinaSheepDetailsPresenter >> sheepChangedBlock [
	^ sheepChangedBlock
]

{ #category : #accessing }
OvinaSheepDetailsPresenter >> sheepChangedBlock: aBlock [
	sheepChangedBlock := aBlock
]
