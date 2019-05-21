"
An OvinaSheepLoaderTest is a test class for testing the behavior of OvinaSheepLoader
"
Class {
	#name : #OvinaSheepLoaderTest,
	#superclass : #TestCase,
	#category : #'Ovina-Tests'
}

{ #category : #tests }
OvinaSheepLoaderTest >> testDefault [
	self assert: OvinaSheepLoader default class equals: OvinaCSVLoader
]

{ #category : #tests }
OvinaSheepLoaderTest >> testLambLoadNotNil [
	| lambs |
	lambs := OvinaSheepLoader default loadLambs.
	self assert: lambs class equals: Array.
	self assert: lambs isEmpty equals: false
]

{ #category : #tests }
OvinaSheepLoaderTest >> testRamLoad [
	| rams |
	rams := OvinaSheepLoader default loadRams.
	self assert: rams class equals: Array.
	self assert: rams size equals: 7.
]
