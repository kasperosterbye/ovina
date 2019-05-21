Class {
	#name : #TestLoaderTest,
	#superclass : #TestCase,
	#category : #'Ovina-Tests'
}

{ #category : #running }
TestLoaderTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	OvinaSheepLoader default: TestOvinaSheepLoader new.
	OvinaSheep managersReset
]

{ #category : #tests }
TestLoaderTest >> testOneEwe [
	OvinaEwe loadEwes.
	self assert: (OvinaEwe manager at: 1000) name equals: 'Bolche'
]

{ #category : #tests }
TestLoaderTest >> testOneLamb [
	OvinaLamb loadLambs.
	self 
		assert: (OvinaLamb manager at: 100) sex 
		equals: 'gimmer'.
]

{ #category : #tests }
TestLoaderTest >> testTwoRams [
	OvinaRam loadRams.
	self assert: (OvinaRam manager at: 10) number equals: 10
]
