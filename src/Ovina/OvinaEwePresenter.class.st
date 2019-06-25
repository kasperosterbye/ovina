"
I present ewes
"
Class {
	#name : #OvinaEwePresenter,
	#superclass : #OvinaSheepPresenter,
	#category : #'Ovina-GUI-SheepLists'
}

{ #category : #specs }
OvinaEwePresenter class >> title [
	^ 'Får'
]

{ #category : #abstract }
OvinaEwePresenter >> detailsPresenter [
	^ self instantiate: OvinaEweDetailsPresenter
]

{ #category : #abstract }
OvinaEwePresenter >> fixedColumns [
	"return the initially selected columns"

	^ #(name number inDate)
]

{ #category : #abstract }
OvinaEwePresenter >> noSheep [
	^ OvinaEwe noEwe
]

{ #category : #abstract }
OvinaEwePresenter >> sheepType [
	"return the class of the kind of sheep I present"

	^ OvinaEwe
]
