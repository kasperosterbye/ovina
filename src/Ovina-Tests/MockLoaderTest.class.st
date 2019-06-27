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
	OvinaEntity managersReset
]

{ #category : #tests }
MockLoaderTest >> testEventDescriptor [
	self assert: (OvinaEventDescription at: 77) descComment equals: 'Marker1ForTest'
]

{ #category : #tests }
MockLoaderTest >> testOneEwe [
	self assert: (OvinaEwe  at: 1000) name equals: 'Bolche'
]

{ #category : #tests }
MockLoaderTest >> testOneLamb [
	self assert: (OvinaLamb  at: 100) sex equals: 'gimmer'
]

{ #category : #tests }
MockLoaderTest >> testTwoRams [
	self assert: (OvinaRam  at: 10) number equals: 10
]
