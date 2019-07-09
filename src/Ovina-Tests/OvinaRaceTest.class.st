"
An OvinaRaceTest is a test class for testing the behavior of OvinaRace
"
Class {
	#name : #OvinaRaceTest,
	#superclass : #TestCase,
	#category : #'Ovina-Tests-Model'
}

{ #category : #tests }
OvinaRaceTest >> testFromFreeText [

		| res |
	res := OvinaRace newFromFreeText: 'SåneTexel'.
		self assert: res printString equals: '1S1T'.
		

]

{ #category : #tests }
OvinaRaceTest >> testMerge1 [
	"Testing non-alphabetic order in r2, testing scale"
	| r1 r2 |
	r1 := OvinaRace newFromString: '1S1T'.
	r2 := OvinaRace newFromString: '1T3L'.
	self assert: (r1 * r2) printString equals: '3L2S3T'
]

{ #category : #tests }
OvinaRaceTest >> testMerge2 [
	"Swapped the arguments compared to Merge1"

	| r1 r2 |
	r1 := OvinaRace newFromString: '1T3L'.
	r2 := OvinaRace newFromString: '1S1T'.
	self assert: (r1 * r2) printString equals: '3L2S3T'
]

{ #category : #tests }
OvinaRaceTest >> testMerge3 [
	"Swapped the arguments compared to Merge1"

	| r1 r2 |
	r1 := OvinaRace newFromString: '1T'.
	r2 := OvinaRace newFromString: '1S1T'.
	self assert: (r1 * r2) printString equals: '1S3T'
]

{ #category : #tests }
OvinaRaceTest >> testNormalize [
	| race |
	race := OvinaRace newFromString: '2T2S'.
	self assert: race printString equals: '1S1T'
]
