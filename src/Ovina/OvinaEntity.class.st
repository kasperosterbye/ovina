Class {
	#name : #OvinaEntity,
	#superclass : #Object,
	#classInstVars : [
		'manager'
	],
	#category : #'Ovina-Model'
}

{ #category : #public }
OvinaEntity class >> manager [
	manager isNil
		ifTrue: [ manager := OvinaEntityManager new ].
	^manager
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
