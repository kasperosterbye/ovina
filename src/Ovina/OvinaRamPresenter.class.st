"
I present Rams
"
Class {
	#name : #OvinaRamPresenter,
	#superclass : #OvinaSheepPresenter,
	#category : #'Ovina-GUI'
}

{ #category : #specs }
OvinaRamPresenter class >> title [
	^ 'Væddere'
]

{ #category : #abstract }
OvinaRamPresenter >> detailsPresenter [
	^ self instantiate: OvinaRamDetailsPresenter
]

{ #category : #'column list presenter' }
OvinaRamPresenter >> fixedColumns [
	"return the initially selected columns"

	^ #(name chr race)
]

{ #category : #abstract }
OvinaRamPresenter >> noSheep [
	^ OvinaRam noRam 
]

{ #category : #abstract }
OvinaRamPresenter >> sheepType [
	"return the class of the kind of sheep I present"

	^ OvinaRam
]
