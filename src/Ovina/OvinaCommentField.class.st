"
I represent a comment field presenter. I am just a normal labeled input field, but with no restriction on the height of my textfield.
"
Class {
	#name : #OvinaCommentField,
	#superclass : #OvinaLabeledInputField,
	#category : #'Ovina-GUI-SheepLists'
}

{ #category : #specs }
OvinaCommentField class >> defaultSpec [
	^ SpecColumnLayout composed
		add: #labelPresenter height: self toolbarHeight;
		add: #textPresenter;
		yourself
]
