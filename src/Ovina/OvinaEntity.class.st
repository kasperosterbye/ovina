Class {
	#name : #OvinaEntity,
	#superclass : #Object,
	#classInstVars : [
		'manager'
	],
	#category : #'Ovina-Model'
}

{ #category : #accessing }
OvinaEntity class >> loadSelector [ 
	self subclassResponsibility 
]

{ #category : #public }
OvinaEntity class >> manager [
	manager isNil
		ifTrue: [ manager := OvinaEntityManager with: self loadSelector ].
	^ manager
]

{ #category : #public }
OvinaEntity class >> managerReset [
	manager := nil.
]

{ #category : #public }
OvinaEntity class >> managersReset [
	(self allSubclasses select: [ :cl | cl subclasses isEmpty ])
		do: [ :entityClass | entityClass managerReset  ]
]
