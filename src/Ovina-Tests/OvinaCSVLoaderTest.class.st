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
	OvinaEntityLoader
		default: (OvinaCSVLoader on: '/Users/kasper/_Projects/Pharo/ovina_test/').
	OvinaEntity managersReset
]

{ #category : #tests }
OvinaCSVLoaderTest >> testBuster [
	| buster |
	buster := OvinaRam manager at: 3.
	self assert: buster name equals: 'Buster'
]

{ #category : #tests }
OvinaCSVLoaderTest >> testLoadEventDescriptions [
	| man |
	man := OvinaEventDescription manager.
	self assert: man size equals: 72
]

{ #category : #tests }
OvinaCSVLoaderTest >> testLoadEvents [
	| man |
	man := OvinaEvent manager.
	self assert: man size equals: 1305
]

{ #category : #tests }
OvinaCSVLoaderTest >> testLoadEwes [
	| man |
	man := OvinaEwe manager.
	self assert: man size equals: 62
]

{ #category : #tests }
OvinaCSVLoaderTest >> testLoadLambs [
	| man |
	man := OvinaLamb manager.
	self assert: man size > 0 equals: true
]

{ #category : #tests }
OvinaCSVLoaderTest >> testLoadRams [
	| man |
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
OvinaCSVLoaderTest >> testPingoLamb [
	| pingo |
	pingo := OvinaLamb manager at: 7.
	self assert: pingo comment equals: 'Pingo - Kasper tester'
]
