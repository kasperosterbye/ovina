"
An OvinaRamTest is a test class for testing the behavior of OvinaRam
"
Class {
	#name : #OvinaRamTest,
	#superclass : #TestCase,
	#category : #'Ovina-Tests'
}

{ #category : #tests }
OvinaRamTest >> testAdd [
	self assert: 7 equals: 3 + 4
]
