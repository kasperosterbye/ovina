"
I am a class for representing checklists. I have two columns, one for booleans, and an other for arbitrary objects which respond to #checkBoxLabel
"
Class {
	#name : #OvinaColumnChecklist,
	#superclass : #SpPresenter,
	#instVars : [
		'elements'
	],
	#category : #'Ovina-GUI'
}

{ #category : #specs }
OvinaColumnChecklist class >> defaultSpec [
	^ SpBoxLayout newHorizontal 
		add: #checkBoxTable ;
      yourself
]

{ #category : #initialization }
OvinaColumnChecklist >> initializeWidgets [ 
	
	| checkList |
	checkList := SpTablePresenter new
		items: elements;
		addColumn: (SpCheckBoxTableColumn title: 'Medtag' evaluated: #first );
		addColumn: (SpStringTableColumn title: 'Kolonne' evaluated: [:arr | arr second content arguments first]);
		showColumnHeaders.
	checkList items: (self optionalColumns collect: [:col | {false. col}]).
	^ checkList 
]
