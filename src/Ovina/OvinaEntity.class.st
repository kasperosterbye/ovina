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

{ #category : #'entity management' }
OvinaEntity class >> all [
	^ self entities values
]

{ #category : #'entity management' }
OvinaEntity class >> allDo: aBlock [
	entities valuesDo: aBlock
]

{ #category : #'entity management' }
OvinaEntity class >> at: id [
	
	^ self entities at: id
]

{ #category : #'entity management' }
OvinaEntity class >> at: key put: sheep [
	self entities at: key put: sheep
]

{ #category : #'entity management' }
OvinaEntity class >> entities [
		entities isNil
		ifTrue: [ self loadEntities ].
		^entities
]

{ #category : #'entity management' }
OvinaEntity class >> loadEntities [
	
	self subclassResponsibility 
]

{ #category : #'entity management' }
OvinaEntity class >> managerReset [
	"force lazy load in method entities"
	entities := nil.
]

{ #category : #'entity management' }
OvinaEntity class >> managersReset [
	"send the managerReset method to all leaf classes of me"
	(self allSubclasses select: [ :cl | cl subclasses isEmpty ])
		do: [ :entityClass | entityClass managerReset  ]
]

{ #category : #'entity management' }
OvinaEntity class >> size [
	^ self entities size
]
