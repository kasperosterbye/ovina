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
		'loader',
		'entities'
	],
	#category : #'Ovina-ModelManager'
}

{ #category : #accessing }
OvinaEntityManager >> all [ 
	^entities values
]

{ #category : #enumerating }
OvinaEntityManager >> allDo: aBlock [
	entities valuesDo: aBlock
]

{ #category : #accessing }
OvinaEntityManager >> at: id [
	^entities at: id
]

{ #category : #accessing }
OvinaEntityManager >> at: key put: sheep [
	entities at: key put: sheep
]

{ #category : #initialization }
OvinaEntityManager >> initialize [
	entities := Dictionary new.
]

{ #category : #accessing }
OvinaEntityManager >> reset [
	entities := Dictionary new.
]

{ #category : #accessing }
OvinaEntityManager >> size [
	^entities size
]
