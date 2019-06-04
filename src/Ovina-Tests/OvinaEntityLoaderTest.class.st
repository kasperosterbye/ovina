"
An OvinaSheepLoaderTest is a test class for testing the behavior of OvinaSheepLoader
"
Class {
	#name : #OvinaEntityLoaderTest,
	#superclass : #TestCase,
	#category : #'Ovina-Tests'
}

{ #category : #running }
OvinaEntityLoaderTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	OvinaEntityLoader default: nil.	
]

{ #category : #tests }
OvinaEntityLoaderTest >> testDefault [
	self assert: OvinaEntityLoader default class equals: OvinaCSVLoader
]

{ #category : #tests }
OvinaEntityLoaderTest >> testLambLoadNotNil [
	| lambs |
	lambs := OvinaEntityLoader default loadLambs.
	self assert: lambs class equals: Array.
	self assert: lambs isEmpty equals: false
]

{ #category : #tests }
OvinaEntityLoaderTest >> testRamLoad [
	| rams |
	rams := OvinaEntityLoader default loadRams.
	self assert: rams class equals: Array.
	self assert: rams size equals: 7.
]
