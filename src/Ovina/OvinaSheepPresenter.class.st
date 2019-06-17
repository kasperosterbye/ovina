"
I represent a general tool to present sheeps.

I consist of three views

1. A list/table of all sheeps of a given type (ram, ewe or lamb)
2. A detail view of the core data of the selected sheep.
3. A view to allow selecting which columns to view in 1.

Only one of the views 2/3 is visible at any point in time.
"
Class {
	#name : #OvinaSheepPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'columnPresenter',
		'view',
		'sheep',
		'sheepListPresenter',
		'sheepPresenter'
	],
	#category : #'Ovina-GUI'
}

{ #category : #specs }
OvinaSheepPresenter class >> defaultSpec [
	| height |
	height := OvinaLabeledInputField height * 2.
	^ SpecColumnLayout composed
		add: #currentView height: height;
		add: #sheepListPresenter;
		yourself
]

{ #category : #example }
OvinaSheepPresenter class >> example [
	OvinaEwePresenter new openWithSpec
]

{ #category : #accessing }
OvinaSheepPresenter class >> extent [ 
	^400@400
]

{ #category : #specs }
OvinaSheepPresenter class >> title [
	^ 'You should override this in subclass'
]

{ #category : #'column list presenter' }
OvinaSheepPresenter >> allColumns [
	"return collumns in the form of pragmas that define them"

	| pragmas |
	pragmas := (self sheepType methods select: [ :m | m pragmas notEmpty ])
		collect: [ :m | m pragmas select: [ :p | p selector = #column: ] ].
	^ pragmas flattened
]

{ #category : #private }
OvinaSheepPresenter >> allSheeps [
	^ self sheepType manager all
]

{ #category : #private }
OvinaSheepPresenter >> changeHeadersFor: aDummyTreeColumnPresenter [
	"I change the columns in the ramListPresenter. I am called as response to clicking the headers menu"

	Transcript
		nextPutAll: 'Changing headers --- changeHeadersFor:';
		cr;
		endEntry
	
]

{ #category : #accessing }
OvinaSheepPresenter >> columnPresenter [
	^ columnPresenter
]

{ #category : #accessing }
OvinaSheepPresenter >> columnPresenter: anObject [
	columnPresenter := anObject
]

{ #category : #private }
OvinaSheepPresenter >> columnPresenterFor: columnPragma [
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
OvinaSheepPresenter >> columnsChanged [
	"I update the columns shown in ramListPresenter"
	sheepListPresenter
		columns: 
			(self selectedSheepColumns  collect: [ :colPragma | self columnPresenterFor: colPragma ])
]

{ #category : #'column list presenter' }
OvinaSheepPresenter >> createColumnList [
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

{ #category : #'sheep list presenter' }
OvinaSheepPresenter >> createSheepList [
	| presenter |
	presenter := TreePresenter new.
	presenter multiSelection: false.
	presenter oddRowColor: Color veryVeryLightGray.
	presenter
		columns:
			(self selectedSheepColumns
				collect: [ :colName | self columnPresenterFor: colName ]).
	presenter roots: self allSheeps.
	^ presenter
]

{ #category : #private }
OvinaSheepPresenter >> currentView [
	"return the current view"
	^view

	
]

{ #category : #abstract }
OvinaSheepPresenter >> detailsPresenter [
	self subclassResponsibility.
]

{ #category : #abstract }
OvinaSheepPresenter >> fixedColumns [
	"return the initially selected columns"

	^self subclassResponsibility 
]

{ #category : #initialization }
OvinaSheepPresenter >> initializePresenter [
	sheepListPresenter
		whenSelectedItemsChanged: [ :col | self sheepSelection: col ].
	columnPresenter
		whenSelectedItemsChanged: [ :col | self columnsChanged ].
	sheepPresenter
		sheepChangedBlock: [ :changedSheep | sheepListPresenter updateTree ]
]

{ #category : #initialization }
OvinaSheepPresenter >> initializeWidgets [
	sheepPresenter := self detailsPresenter.
	columnPresenter := self createColumnList.
	sheepListPresenter := self createSheepList.
	view := sheepPresenter
]

{ #category : #abstract }
OvinaSheepPresenter >> noSheep [
	^self subclassResponsibility .	
]

{ #category : #'column list presenter' }
OvinaSheepPresenter >> optionalColumns [
	"return the initially selected columns"

	^ self allColumns
		reject: [ :col | self fixedColumns includes: col method selector ]
]

{ #category : #'column list presenter' }
OvinaSheepPresenter >> selectedSheepColumns [
	"I return just those columns selected in the headerPresenter. If none selected I retun name"

	| selectedColumnPragmas fixedColumnPragmas |
	selectedColumnPragmas := columnPresenter selectedItems
		collect: [ :node | node content ].
	fixedColumnPragmas := self allColumns
		select: [ :col | self fixedColumns includes: col method selector ].
	^ fixedColumnPragmas , selectedColumnPragmas
]

{ #category : #accessing }
OvinaSheepPresenter >> sheep [
	^ sheep
]

{ #category : #accessing }
OvinaSheepPresenter >> sheep: anObject [
	sheep := anObject
]

{ #category : #accessing }
OvinaSheepPresenter >> sheepListPresenter [
	^ sheepListPresenter
]

{ #category : #accessing }
OvinaSheepPresenter >> sheepListPresenter: anObject [
	sheepListPresenter := anObject
]

{ #category : #accessing }
OvinaSheepPresenter >> sheepPresenter [
	^ sheepPresenter
]

{ #category : #accessing }
OvinaSheepPresenter >> sheepPresenter: anObject [
	sheepPresenter := anObject
]

{ #category : #private }
OvinaSheepPresenter >> sheepSelection: aSelectionCollection [
	sheep := aSelectionCollection isEmpty
		ifTrue: [ self noSheep ]
		ifFalse: [ aSelectionCollection first ].
	sheepPresenter sheep: sheep
]

{ #category : #abstract }
OvinaSheepPresenter >> sheepType [
	"return the class of the kind of sheep I present"
	^ self subclassResponsibility 

	
]

{ #category : #private }
OvinaSheepPresenter >> switchView [
	"return the current view"

	view := view = sheepPresenter
		ifTrue: [ columnPresenter ]
		ifFalse: [ sheepPresenter ].
	self needRebuild: false.
	self buildWithSpecLayout: self class defaultSpec
]
