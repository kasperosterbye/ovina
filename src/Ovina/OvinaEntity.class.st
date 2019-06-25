"
I represnt domain objects in Ovina.

My primary responsibility is to add class side support for managing the collection of entities retrieved from permanent storage.

I also am the home of the ""loadAllEntities"" method which works together with the specific entity loaders to load all entities from permanent storage, and set up the relationsships between those entities.
"
Class {
	#name : #OvinaEntity,
	#superclass : #Object,
	#classInstVars : [
		'entities'
	],
	#category : #'Ovina-Model'
}

{ #category : #accessing }
OvinaEntity class >> all [
	^ self entities values
]

{ #category : #enumerating }
OvinaEntity class >> allDo: aBlock [
	entities valuesDo: aBlock
]

{ #category : #accessing }
OvinaEntity class >> at: id [
	
	^ self entities at: id
]

{ #category : #accessing }
OvinaEntity class >> at: key put: sheep [
	self entities at: key put: sheep
]

{ #category : #accessing }
OvinaEntity class >> entities [
		entities isNil
		ifTrue: [ self loadEntities ].
		^entities
]

{ #category : #'class initialization' }
OvinaEntity class >> initialize [
	entities := Dictionary new.
]

{ #category : #private }
OvinaEntity class >> loadEntities [
	
	self subclassResponsibility 
]

{ #category : #public }
OvinaEntity class >> manager [
	"manager isNil
		ifTrue: [ manager := OvinaEntityManager with: self loadSelector ].
	^ manager"
	^self.
]

{ #category : #public }
OvinaEntity class >> managerReset [
	entities := nil
]

{ #category : #public }
OvinaEntity class >> managersReset [
	"send the managerReset method to all leaf classes of me"
	(self allSubclasses select: [ :cl | cl subclasses isEmpty ])
		do: [ :entityClass | entityClass managerReset  ]
]

{ #category : #accessing }
OvinaEntity class >> size [
	^ self entities size
]
