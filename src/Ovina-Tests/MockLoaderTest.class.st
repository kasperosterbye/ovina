Class {
	#name : #MockLoaderTest,
	#superclass : #TestCase,
	#category : #'Ovina-Tests'
}

{ #category : #running }
MockLoaderTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	OvinaEntityLoader default: MockOvinaEntityLoader new.
	OvinaSheep managersReset
]

{ #category : #tests }
MockLoaderTest >> testOneEwe [
	OvinaEwe loadEwes.
	self assert: (OvinaEwe manager at: 1000) name equals: 'Bolche'
]

{ #category : #tests }
MockLoaderTest >> testOneLamb [
	OvinaLamb loadLambs.
	self 
		assert: (OvinaLamb manager at: 100) sex 
		equals: 'gimmer'.
]

{ #category : #tests }
MockLoaderTest >> testTwoRams [
	OvinaRam loadRams.
	self assert: (OvinaRam manager at: 10) number equals: 10
]
