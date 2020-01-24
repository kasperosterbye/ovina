"
I am the entry point for the OvinaApp
"
Class {
	#name : #OvinaApp,
	#superclass : #SpPresenter,
	#instVars : [
		'eventsPage',
		'eweLambPage',
		'mainNotebook',
		'overviewPage'
	],
	#category : #'Ovina-GUI'
}

{ #category : #specs }
OvinaApp class >> defaultSpec [
	^ SpBoxLayout newHorizontal 
		add: #mainNotebook ;
      yourself
]

{ #category : #examples }
OvinaApp class >> start [
	<example>
	OvinaEntityLoader default: nil.
	OvinaEntity managersReset.
	self new openWithSpec.
]

{ #category : #specs }
OvinaApp class >> tableExample [
	<example>
	| example items|
	items := String methods.
	example := SpTablePresenter new.
	example
		items: items;
		addColumn: (SpStringTableColumn title: 'Selector' evaluated: #selector) beEditable ;
		addColumn: (SpStringTableColumn title: 'Size' evaluated: #size);
		addColumn: (SpCheckBoxTableColumn title: 'Extension' evaluated: #isExtension );
		showColumnHeaders;
		openWithSpec.
	^ example
]

{ #category : #deprecation }
OvinaApp >> deprecated: anExplanationString on: date in: version [
	"Warn that the sending method has been deprecated"
	
	self error: 'This is soo oldschool to call this method'
]

{ #category : #accessing }
OvinaApp >> eventsPage [
	^ eventsPage
]

{ #category : #accessing }
OvinaApp >> eventsPage: anObject [
	eventsPage := anObject
]

{ #category : #accessing }
OvinaApp >> eweLambPage [
	^ eweLambPage
]

{ #category : #accessing }
OvinaApp >> eweLambPage: anObject [
	eweLambPage := anObject
]

{ #category : #initialization }
OvinaApp >> extent [
	^ 1200@800
]

{ #category : #initialization }
OvinaApp >> initializePresenter [
   mainNotebook whenSelectedPageChangedDo: [ 'Hi there' logCr].
]

{ #category : #initialization }
OvinaApp >> initializeWidgets [
	| tab |
	mainNotebook := self newNotebook .
	tab := self newNotebookPage .
	tab presenterProvider: [OvinaEweLambTab  new].
	tab
		title: 'Får og lam'.
	mainNotebook addPage: tab
]

{ #category : #accessing }
OvinaApp >> mainNotebook [
	^ mainNotebook
]

{ #category : #accessing }
OvinaApp >> mainNotebook: anObject [
	mainNotebook := anObject
]

{ #category : #accessing }
OvinaApp >> overviewPage [
	^ overviewPage
]

{ #category : #accessing }
OvinaApp >> overviewPage: anObject [
	overviewPage := anObject
]

{ #category : #initialization }
OvinaApp >> title [
	^'Ovina'
]
