Class {
	#name : #OvinaSheepManager,
	#superclass : #Object,
	#instVars : [
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
