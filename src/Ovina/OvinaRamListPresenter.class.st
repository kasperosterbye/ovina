"
I present a list of rams, and allow details of them to be shown.

state = #details | #columns
"
Class {
	#name : #OvinaRamListPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'ramPresenter',
		'ramListPresenter',
		'columnPresenter',
		'ram',
		'view'
	],
	#category : #'Ovina-GUI'
}

{ #category : #specs }
OvinaRamListPresenter class >> defaultSpec [
	| height |
	height := OvinaLabeledInputField height * 2.
	^ SpecColumnLayout composed
		add: #currentView height: height;
		add: #ramListPresenter;
		yourself
]

{ #category : #example }
OvinaRamListPresenter class >> example [
	self new openWithSpec 
]

{ #category : #accessing }
OvinaRamListPresenter class >> extent [ 
	^400@400
]

{ #category : #specs }
OvinaRamListPresenter class >> title [
	^'Væddere'
]

{ #category : #'column list presenter' }
OvinaRamListPresenter >> allColumns [
	"return collumns in the form of pragmas that define them"
	| pragmas |
	pragmas := (OvinaRam methods select: [ :m | m pragmas notEmpty ])
		collect: [ :m | m pragmas select: [ :p | p selector = #column: ] ].
	^ pragmas flattened
]

{ #category : #'dynamic view handling' }
OvinaRamListPresenter >> changeHeadersFor: aDummyTreeColumnPresenter [
	"I change the columns in the ramListPresenter. I am called as response to clicking the headers menu"

	Transcript
		nextPutAll: 'Changing headers --- changeHeadersFor:';
		cr;
		endEntry
	
]

{ #category : #accessing }
OvinaRamListPresenter >> columnPresenter [
	^ columnPresenter
]

{ #category : #accessing }
OvinaRamListPresenter >> columnPresenter: anObject [
	columnPresenter := anObject
]

{ #category : #'ui building' }
OvinaRamListPresenter >> columnPresenterFor: columnPragma [
	"I return a new TreeColumnPresenter for the pragma"

	| displayBlock colLabel |
	displayBlock := [ :node | 
	(columnPragma method valueWithReceiver: node content arguments: #())
		asString ].
	colLabel := (columnPragma argumentAt: 1) capitalized.
	^ TreeColumnPresenter new
		displayBlock: displayBlock;
		headerLabel: colLabel;
		headerAction: [ :x | self switchView ];
		yourself
]

{ #category : #'column list presenter' }
OvinaRamListPresenter >> columnsChanged [
	"I update the columns shown in ramListPresenter"
	ramListPresenter
		columns: 
			(self selectedRamColumns  collect: [ :colPragma | self columnPresenterFor: colPragma ])
]

{ #category : #'column list presenter' }
OvinaRamListPresenter >> createColumnList [
	| tree col |
	tree := TreePresenter new.
	tree beCheckList.
	tree multiSelection: true.
	tree autoMultiSelection: true.
	tree oddRowColor: Color veryVeryLightGray.
	col := TreeColumnPresenter new
		displayBlock: [ :pragma | pragma content arguments first ];
		headerLabel: 'Valgfri kolonner';
		yourself.
	tree columns: (Array with: col).
	tree roots: self optionalColumns.
	^ tree
]

{ #category : #'ram list presenter' }
OvinaRamListPresenter >> createRamList [
	| presenter |
	presenter  := TreePresenter new.
	presenter multiSelection: false.
	presenter oddRowColor: Color veryVeryLightGray.
	presenter
		columns:
			(self selectedRamColumns  collect: [ :colName | self columnPresenterFor: colName ]).
	presenter roots: OvinaRam allRams.
	^ presenter
]

{ #category : #'dynamic view handling' }
OvinaRamListPresenter >> currentView [
	"return the current view"
	^view

	
]

{ #category : #'column list presenter' }
OvinaRamListPresenter >> fixedColumns [
	"return the initially selected columns"

	| fixedColumns |
	fixedColumns := #(name chr race).
	^ self allColumns
		select: [ :col | fixedColumns includes: col method selector ]
]

{ #category : #initialization }
OvinaRamListPresenter >> initializePresenter [
	ramListPresenter
		whenSelectedItemsChanged: [ :col | self ramSelection: col ].
	columnPresenter 
		whenSelectedItemsChanged: [ :col | self columnsChanged ].
	ramPresenter
		ramChanged: [ :changedRam | ramListPresenter updateTree ].
]

{ #category : #initialization }
OvinaRamListPresenter >> initializeWidgets [
	ramPresenter := self instantiate: OvinaRamPresenter.
	columnPresenter := self createColumnList.
	ramListPresenter := self createRamList.
	view := ramPresenter
]

{ #category : #'instance creation' }
OvinaRamListPresenter >> open [
	| tree |
	tree := TreePresenter new.
	tree beCheckList.
	tree multiSelection: true.
	tree
		columns: (self selectedRamColumns  collect: [ :colName | self columnPresenterFor: colName ]).
	tree roots: self class csvContents upToEnd.
	tree openWithSpec
]

{ #category : #'column list presenter' }
OvinaRamListPresenter >> optionalColumns [
	"return the initially selected columns"

	| fixedColumns |
	fixedColumns := #(name chr race).
	^ self allColumns
		reject: [ :col | fixedColumns includes: col method selector ]
]

{ #category : #accessing }
OvinaRamListPresenter >> ram [
	^ ram
]

{ #category : #accessing }
OvinaRamListPresenter >> ram: anObject [
	ram := anObject
]

{ #category : #accessing }
OvinaRamListPresenter >> ramListPresenter [
	^ ramListPresenter
]

{ #category : #accessing }
OvinaRamListPresenter >> ramListPresenter: anObject [
	ramListPresenter := anObject
]

{ #category : #accessing }
OvinaRamListPresenter >> ramPresenter [
	^ ramPresenter
]

{ #category : #accessing }
OvinaRamListPresenter >> ramPresenter: anObject [
	ramPresenter := anObject
]

{ #category : #private }
OvinaRamListPresenter >> ramSelection: aSelectionCollection [
	ram := aSelectionCollection isEmpty
		ifTrue: [ OvinaRam noRam ]
		ifFalse: [ aSelectionCollection first ].
	ramPresenter ram: ram.
]

{ #category : #'column list presenter' }
OvinaRamListPresenter >> selectedRamColumns [
	"I return just those columns selected in the headerPresenter. If none selected I retun name"

	| selectedColumnPragmas |
	selectedColumnPragmas := columnPresenter selectedItems collect: [ :node | node content ].
	^ self fixedColumns , selectedColumnPragmas
]

{ #category : #'dynamic view handling' }
OvinaRamListPresenter >> switchView [
	"return the current view"

	view := view = ramPresenter
		ifTrue: [ columnPresenter ]
		ifFalse: [ ramPresenter ].
	self needRebuild: false.
	self buildWithSpecLayout: self class defaultSpec
]
