"
I am the entry point for the OvinaApp
"
Class {
	#name : #OvinaApp,
	#superclass : #ComposablePresenter,
	#instVars : [
		'mainTabManager',
		'eweLambTab',
		'eventsTab',
		'overviewTab'
	],
	#category : #'Ovina-GUI'
}

{ #category : #specs }
OvinaApp class >> defaultSpec [
	^ SpecLayout composed
          add: #mainTabManager;
          yourself
]

{ #category : #examples }
OvinaApp class >> start [
	<example>
	OvinaEntityLoader default: nil.
	OvinaEntity managersReset.
	self new openWithSpec.
]

{ #category : #accessing }
OvinaApp >> eventsTab [
	^ eventsTab
]

{ #category : #accessing }
OvinaApp >> eventsTab: anObject [
	eventsTab := anObject
]

{ #category : #accessing }
OvinaApp >> eweLambTab [
	^ eweLambTab
]

{ #category : #accessing }
OvinaApp >> eweLambTab: anObject [
	eweLambTab := anObject
]

{ #category : #initialization }
OvinaApp >> extent [
	^ 1200@800
]

{ #category : #initialization }
OvinaApp >> initializePresenter [
        mainTabManager whenTabSelected: [ 'Hi there' logCr
          ].
]

{ #category : #initialization }
OvinaApp >> initializeWidgets [
	| tab |
	mainTabManager := self newTabManager.
	tab := self newTab.
	tab presenter: OvinaEweLambTab  new.
	tab
		label: 'Får og lam';
		closeable: false.
	mainTabManager addTab: tab
]

{ #category : #accessing }
OvinaApp >> mainTabManager [
	^ mainTabManager
]

{ #category : #accessing }
OvinaApp >> mainTabManager: anObject [
	mainTabManager := anObject
]

{ #category : #accessing }
OvinaApp >> overviewTab [
	^ overviewTab
]

{ #category : #accessing }
OvinaApp >> overviewTab: anObject [
	overviewTab := anObject
]

{ #category : #initialization }
OvinaApp >> title [
	^'Ovina'
]
