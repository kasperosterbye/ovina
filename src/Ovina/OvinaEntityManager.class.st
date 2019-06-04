"
I manage entities in Ovina.

There is one manager for each of the entities of eve, lamb and ram, as well as event-descriptions and events.

I am maintain a simple dictionary mapping id to entity.

I use a loader which can provide me with the entities. 
"
Class {
	#name : #OvinaEntityManager,
	#superclass : #Object,
	#instVars : [
		'entities',
		'loadSelector'
	],
	#category : #'Ovina-ModelManager'
}

{ #category : #'instance creation' }
OvinaEntityManager class >> with: loadSelector [
	^self new loadSelector: loadSelector; yourself
]

{ #category : #public }
OvinaEntityManager >> all [
	^ self entities values
]

{ #category : #private }
OvinaEntityManager >> allDo: aBlock [
	entities valuesDo: aBlock
]

{ #category : #public }
OvinaEntityManager >> at: id [
	
	^ self entities at: id
]

{ #category : #public }
OvinaEntityManager >> at: key put: sheep [
	self entities at: key put: sheep
]

{ #category : #private }
OvinaEntityManager >> entities [
		entities isEmpty
		ifTrue: [ self loadEntities ].
		^entities
]

{ #category : #private }
OvinaEntityManager >> initialize [
	entities := Dictionary new.
]

{ #category : #private }
OvinaEntityManager >> loadEntities [ 
	self perform: loadSelector 
]

{ #category : #private }
OvinaEntityManager >> loadEventDescriptions [
	entities := OvinaEntityLoader default loadEventDescriptions
]

{ #category : #private }
OvinaEntityManager >> loadEvents [
	entities := OvinaEntityLoader default loadEvents
]

{ #category : #private }
OvinaEntityManager >> loadEwes [
	entities := OvinaEntityLoader default loadEwes
]

{ #category : #private }
OvinaEntityManager >> loadLambs [
	entities := OvinaEntityLoader default loadLambs
]

{ #category : #private }
OvinaEntityManager >> loadRams [
	entities := OvinaEntityLoader default loadRams
]

{ #category : #private }
OvinaEntityManager >> loadSelector [
	^ loadSelector
]

{ #category : #private }
OvinaEntityManager >> loadSelector: anObject [
	loadSelector := anObject
]

{ #category : #public }
OvinaEntityManager >> reset [
	entities := Dictionary new.
]

{ #category : #public }
OvinaEntityManager >> size [
	^ self entities size
]
