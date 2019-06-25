"
I present lambs
"
Class {
	#name : #OvinaLambPresenter,
	#superclass : #OvinaSheepPresenter,
	#category : #'Ovina-GUI-SheepLists'
}

{ #category : #specs }
OvinaLambPresenter class >> title [
	^ 'Lam'
]

{ #category : #abstract }
OvinaLambPresenter >> detailsPresenter [
	^ self instantiate: OvinaLambDetailsPresenter
]

{ #category : #abstract }
OvinaLambPresenter >> fixedColumns [
	"return the initially selected columns"

	^ #(number sex)
]

{ #category : #abstract }
OvinaLambPresenter >> noSheep [
	^ OvinaLamb noLamb
]

{ #category : #abstract }
OvinaLambPresenter >> sheepType [
	"return the class of the kind of sheep I present"

	^ OvinaLamb
]
