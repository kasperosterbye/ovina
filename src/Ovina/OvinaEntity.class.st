Class {
	#name : #OvinaEntity,
	#superclass : #Object,
	#classInstVars : [
		'manager'
	],
	#category : #'Ovina-Model'
}

{ #category : #accessing }
OvinaEntity class >> manager [
	manager isNil
		ifTrue: [ manager := OvinaEntityManager new ].
	^manager
]

{ #category : #accessing }
OvinaEntity class >> managerReset [
	manager := nil.
]

{ #category : #accessing }
OvinaEntity class >> managersReset [
	OvinaEwe managerReset.
	OvinaLamb managerReset .
	OvinaRam managerReset .
]
