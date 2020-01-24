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
	#superclass : #SpPresenter,
	#instVars : [
		'columnPresenter',
		'view',
		'sheep',
		'sheepListPresenter',
		'sheepPresenter',
		'selectionChangeBlock'
	],
	#category : #'Ovina-GUI-SheepLists'
}

{ #category : #specs }
OvinaSheepPresenter class >> defaultSpec [
	| height |
	height := OvinaLabeledInputField height * 2.
	^ SpBoxLayout newVertical 
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
	^ self sheepType all
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
	"I return a new SpStringTableColumn for the pragma"

	| displayBlock colLabel |
	displayBlock := [ :node | 
	(columnPragma method valueWithReceiver: node arguments: #())
		asString ].
	colLabel := (columnPragma argumentAt: 1) capitalized.
	^ SpStringTableColumn  
		title: colLabel
		evaluated: displayBlock.
]

{ #category : #'column list presenter' }
OvinaSheepPresenter >> columnsChanged [
	"I update the columns shown in sheepListPresenter"
	sheepListPresenter
		columns: 
			(self selectedSheepColumns  collect: [ :colPragma | self columnPresenterFor: colPragma ])
]

{ #category : #'column list presenter' }
OvinaSheepPresenter >> createColumnList [
	| checkList |
	checkList := SpTablePresenter new
		addColumn: (SpCheckBoxTableColumn title: 'Medtag' evaluated: #first );
		addColumn: (SpStringTableColumn title: 'Kolonne' evaluated: [:arr | arr second arguments first]);
		showColumnHeaders.
	checkList items: (self optionalColumns collect: [:col | {false. col}]).
	^ checkList 
]

{ #category : #'column list presenter' }
OvinaSheepPresenter >> createColumnListOld [
	| table col |
	table := self newList.
	table beCheckList.
	table beMultipleSelection .
	table autoMultiSelection: true.
	table oddRowColor: Color veryVeryLightGray.
	col := TreeColumnPresenter new
		displayBlock: [ :pragma | pragma content arguments first ];
		headerLabel: 'Valgfri kolonner';
		yourself.
	table columns: (Array with: col).
	table items: self optionalColumns.
	^ table
]

{ #category : #'sheep list presenter' }
OvinaSheepPresenter >> createSheepList [
	| presenter |
	presenter := self newTable.
	presenter beSingleSelection .
	"presenter oddRowColor: Color veryVeryLightGray."
	presenter
		columns:
			(self selectedSheepColumns
				collect: [ :colName | self columnPresenterFor: colName ]).
	presenter items: self allSheeps.
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
		whenSelectedItemsChanged: [ :collection | self sheepSelection: collection ].
	columnPresenter
		whenSelectedItemsChanged: [ :column | self columnsChanged ].
	sheepPresenter
		sheepChangedBlock: [ :changedSheep | sheepListPresenter updateTree ]
]

{ #category : #initialization }
OvinaSheepPresenter >> initializeWidgets [
	sheepPresenter := self detailsPresenter.
	columnPresenter := self createColumnList.
	sheepListPresenter := self createSheepList.
	view := columnPresenter 
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

{ #category : #'Ugly code override' }
OvinaSheepPresenter >> presenterAt: aName ifAbsent: aBlock [
	"Retrieves a subpresenter of this composed presenter."

	^ [ self perform: aName ]
		on: SlotNotFound
		do: aBlock
]

{ #category : #'column list presenter' }
OvinaSheepPresenter >> selectedSheepColumns [
	"I return just those columns selected in the headerPresenter. If none selected I retun name"

	| selectedColumnPragmas fixedColumnPragmas |
	selectedColumnPragmas := columnPresenter selectedItems
		collect: [ :node | node second ].
	fixedColumnPragmas := self allColumns
		select: [ :col | self fixedColumns includes: col method selector ].
	^ fixedColumnPragmas , selectedColumnPragmas
]

{ #category : #accessing }
OvinaSheepPresenter >> selectionChangeBlock [
	^ selectionChangeBlock
]

{ #category : #accessing }
OvinaSheepPresenter >> selectionChangeBlock: anObject [
	selectionChangeBlock := anObject
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
	sheepPresenter sheep: sheep.
	selectionChangeBlock ifNotNil: [ selectionChangeBlock value: sheep ]
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
