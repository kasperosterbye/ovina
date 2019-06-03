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
		'sheeps'
	],
	#category : #'Ovina-ModelManager'
}

{ #category : #adding }
OvinaEntityManager >> add: sheep at: key [
	sheeps at: key put: sheep
]

{ #category : #accessing }
OvinaEntityManager >> all [ 
	^sheeps values
]

{ #category : #enumerating }
OvinaEntityManager >> allDo: aBlock [
	sheeps valuesDo: aBlock
]

{ #category : #accessing }
OvinaEntityManager >> at: id [
	^sheeps at: id
]

{ #category : #initialization }
OvinaEntityManager >> initialize [
	sheeps := Dictionary new.
]

{ #category : #access }
OvinaEntityManager >> reset [
	sheeps := Dictionary new.
]

{ #category : #accessing }
OvinaEntityManager >> size [
	^sheeps size
]
