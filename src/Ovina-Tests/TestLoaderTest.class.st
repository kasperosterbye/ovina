Class {
	#name : #TestLoaderTest,
	#superclass : #TestCase,
	#category : #'Ovina-Tests'
}

{ #category : #tests }
TestLoaderTest >> testOneEwe [
	OvinaSheepLoader default: TestOvinaSheepLoader new.
	OvinaEwe managerReset.
	OvinaEwe loadEwes.
	self 
		assert: (OvinaEwe manager at: 1000) name 
		equals: 'Bolche'.
]

{ #category : #tests }
TestLoaderTest >> testOneLamb [
	OvinaSheepLoader default: TestOvinaSheepLoader new.
	OvinaLamb managerReset.
	OvinaLamb loadLambs.
	self 
		assert: (OvinaLamb manager at: 100) sex 
		equals: 'gimmer'.
]

{ #category : #tests }
TestLoaderTest >> testTwoRams [
	OvinaSheepLoader default: TestOvinaSheepLoader new.
	OvinaRam managerReset.
	OvinaRam loadRams.
	self 
		assert: (OvinaRam manager at: 10) number 
		equals: 10.
]
