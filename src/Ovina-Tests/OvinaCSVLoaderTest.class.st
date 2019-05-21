"
An OvinaSheepTest is a test class for testing the behavior of OvinaSheep
"
Class {
	#name : #OvinaCSVLoaderTest,
	#superclass : #TestCase,
	#category : #'Ovina-Tests'
}

{ #category : #running }
OvinaCSVLoaderTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	super setUp.
	OvinaSheepLoader default: (OvinaCSVLoader on: '/Users/kasper/_Projects/Pharo/ovina_test/').
	OvinaSheep managersReset
]

{ #category : #tests }
OvinaCSVLoaderTest >> testAllLambs [
	| man |
	OvinaLamb loadLambs.
	man := OvinaLamb manager.
	self assert: man size > 0 equals: true
]

{ #category : #tests }
OvinaCSVLoaderTest >> testAllRams [
	| man |
	OvinaRam loadRams.
	man := OvinaRam manager.
	self assert: man size equals: 7
]

{ #category : #tests }
OvinaCSVLoaderTest >> testBuster [
	| buster |
	OvinaRam loadRams.
	buster := OvinaRam manager at: 3.
	self assert: buster name equals: 'Buster'.
]

{ #category : #tests }
OvinaCSVLoaderTest >> testManagerNotNil [
	| man |
	man := OvinaSheep manager.
	self deny: man equals: nil. 
]

{ #category : #tests }
OvinaCSVLoaderTest >> testManagerReset [
	| man |
	man := OvinaSheep manager.
	man reset.
	man allDo: [self fail]. 
]

{ #category : #tests }
OvinaCSVLoaderTest >> testPingoLamb [
	| pingo |
	OvinaLamb loadLambs.
	pingo := OvinaLamb manager at: 7.
	self assert: pingo comment equals: 'Pingo - Kasper tester'.
]
