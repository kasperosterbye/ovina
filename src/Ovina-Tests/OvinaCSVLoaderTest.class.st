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
	OvinaEntityLoader default: (OvinaCSVLoader on: '/Users/kasper/_Projects/Pharo/ovina_test/').
	OvinaSheep managersReset
]

{ #category : #tests }
OvinaCSVLoaderTest >> testBuster [
	| buster |
	OvinaRam loadRams.
	buster := OvinaRam manager at: 3.
	self assert: buster name equals: 'Buster'.
]

{ #category : #tests }
OvinaCSVLoaderTest >> testLoadEventDescriptions [
	| man |
	OvinaEventDescription loadEventDescriptions.
	man := OvinaEventDescription manager.
	self assert: man size equals: 72
]

{ #category : #tests }
OvinaCSVLoaderTest >> testLoadEvents [
	| man |
	OvinaEvent loadEvents.
	man := OvinaEvent manager.
	self assert: man size equals: 1305
]

{ #category : #tests }
OvinaCSVLoaderTest >> testLoadEwes [
	| man |
	OvinaEwe loadEwes.
	man := OvinaEwe manager.
	self assert: man size equals: 62.
]

{ #category : #tests }
OvinaCSVLoaderTest >> testLoadLambs [
	| man |
	OvinaLamb loadLambs.
	man := OvinaLamb manager.
	self assert: man size > 0 equals: true
]

{ #category : #tests }
OvinaCSVLoaderTest >> testLoadRams [
	| man |
	OvinaRam loadRams.
	man := OvinaRam manager.
	self assert: man size equals: 7
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
