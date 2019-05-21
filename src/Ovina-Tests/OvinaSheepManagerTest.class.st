"
An OvinaSheepTest is a test class for testing the behavior of OvinaSheep
"
Class {
	#name : #OvinaSheepManagerTest,
	#superclass : #TestCase,
	#category : #'Ovina-Tests'
}

{ #category : #tests }
OvinaSheepManagerTest >> testAllLambs [
	| man |
	OvinaLamb   loadLambs.
	man := OvinaRam manager.
	self assert: man size equals: 7
]

{ #category : #tests }
OvinaSheepManagerTest >> testAllRams [
	| man |
	OvinaRam loadRams.
	man := OvinaRam manager.
	self assert: man size equals: 7
]

{ #category : #tests }
OvinaSheepManagerTest >> testBuster [
	| buster |
	OvinaRam loadRams.
	buster := OvinaRam manager at: 3.
	self assert: buster name equals: 'Buster'.
]

{ #category : #tests }
OvinaSheepManagerTest >> testManagerNotNil [
	| man |
	man := OvinaSheep manager.
	self deny: man equals: nil. 
]

{ #category : #tests }
OvinaSheepManagerTest >> testManagerReset [
	| man |
	man := OvinaSheep manager.
	man reset.
	man allDo: [self fail]. 
]

{ #category : #tests }
OvinaSheepManagerTest >> testPingoLamb [
	| pingo |
	OvinaLamb loadLambs.
	pingo := OvinaLamb manager at: 7.
	self assert: pingo comment equals: 'Pingo - Kasper tester'.
]
