"
I test the methods which derive information from the event history
"
Class {
	#name : #OvinaEventAccessTest,
	#superclass : #TestCase,
	#category : #'Ovina-Tests'
}

{ #category : #running }
OvinaEventAccessTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	OvinaEntityLoader default: MockOvinaEntityLoader new.
	OvinaEntity managersReset
]

{ #category : #tests }
OvinaEventAccessTest >> testLastEvent [
	| event ewe |
	ewe := OvinaEwe at: 1000.
	
	event := ewe lastEvent: 'flytning'.
	self assert: event eventDate equals: '2019-05-17' asDate.
]

{ #category : #tests }
OvinaEventAccessTest >> testLastGrowthPrognosisMoreMeasurements [
	"Test the case with just more than two measurement"
	self fail.
]

{ #category : #tests }
OvinaEventAccessTest >> testLastGrowthPrognosisNoMeasurements [
	"Test the case where there are no measurements/events, and we just have to rely on the finale registred data. This is the case for older lambs"
	| lamb lgp |
	lamb := OvinaLamb at: 100.
	lgp := lamb lastGrowthPrognosis .
	self assert: lgp equals: 150.
	
]

{ #category : #tests }
OvinaEventAccessTest >> testLastGrowthPrognosisOneMeasurement [
	"Test the case with just one measurement"
		| lamb lgp |
	lamb := OvinaLamb at: 101.
	lgp := lamb lastGrowthPrognosis .
	self assert: lgp equals: 200.
]

{ #category : #tests }
OvinaEventAccessTest >> testLastGrowthPrognosisTwoMeasurements [
	"Test the case with just two measurement"
	self fail.
]

{ #category : #tests }
OvinaEventAccessTest >> testLocation [
	| location ewe |
	ewe := OvinaEwe at: 1000.
	location := ewe location.
	self assert: location  equals: 'sæter'.
]
