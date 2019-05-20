"
I manage sheeps in Ovina.

There is one manager for each of the three kinds of sheeps, eve, lamb and ram.

I am maintain a simple dictionary mapping id to animal.

I use a loader which can provide me with the animals. 
"
Class {
	#name : #OvinaSheepManager,
	#superclass : #Object,
	#instVars : [
		'loader',
		'sheeps'
	],
	#category : #Ovina
}

{ #category : #adding }
OvinaSheepManager >> add: sheep at: key [
	sheeps at: key put: sheep
]

{ #category : #accessing }
OvinaSheepManager >> all [ 
	^sheeps values
]

{ #category : #enumerating }
OvinaSheepManager >> allDo: aBlock [
	sheeps valuesDo: aBlock
]

{ #category : #accessing }
OvinaSheepManager >> at: id [
	^sheeps at: id
]

{ #category : #initialization }
OvinaSheepManager >> initialize [
	sheeps := Dictionary new.
]

{ #category : #access }
OvinaSheepManager >> reset [
	sheeps := Dictionary new.
]

{ #category : #accessing }
OvinaSheepManager >> size [
	^sheeps size
]
