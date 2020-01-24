"
I represent an inputfield with a label specifying what is in the textfield.

"
Class {
	#name : #OvinaLabeledInputField,
	#superclass : #SpPresenter,
	#instVars : [
		'labelPresenter',
		'textPresenter'
	],
	#category : #'Ovina-GUI-SheepLists'
}

{ #category : #specs }
OvinaLabeledInputField class >> defaultSpec [
	^ SpBoxLayout newVertical 
		add: #labelPresenter height: self toolbarHeight; 
		add: #textPresenter  height: self inputTextHeight ;
		yourself.
]

{ #category : #'as yet unclassified' }
OvinaLabeledInputField class >> height [
	^ self toolbarHeight * 2 + 5.
]

{ #category : #initialization }
OvinaLabeledInputField >> initializeWidgets [
	"instantiation"
	labelPresenter := self newLabel.
	textPresenter := self newTextInput .
		
	"configuration"
	labelPresenter label: 'Value'.
	
	"focus"
	self focusOrder
		add: textPresenter.
]

{ #category : #accessing }
OvinaLabeledInputField >> label: aLabelString text: initialText [
	self labelPresenter label: aLabelString.
	self textPresenter text: initialText.
]

{ #category : #accessing }
OvinaLabeledInputField >> labelPresenter [
	^ labelPresenter
]

{ #category : #accessing }
OvinaLabeledInputField >> text: aText [
	textPresenter text: aText
]

{ #category : #accessing }
OvinaLabeledInputField >> textPresenter [
	^ textPresenter
]
