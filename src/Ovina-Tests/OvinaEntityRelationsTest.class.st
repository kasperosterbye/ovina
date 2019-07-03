"
I will test the relations in the entity model: 

Offspring in ewe and ram,
parents in lamb

Eventlist from EventDescriptions 
Description from event
and sheep from event

I base my test on the MockOvinaEntities
"
Class {
	#name : #OvinaEntityRelationsTest,
	#superclass : #TestCase,
	#category : #'Ovina-Tests'
}

{ #category : #running }
OvinaEntityRelationsTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	super setUp.
	OvinaEntityLoader default: MockOvinaEntityLoader new.
	OvinaEntity managersReset
]

{ #category : #running }
OvinaEntityRelationsTest >> tearDown [
	OvinaEntityLoader default: nil.
	OvinaSheep managersReset.
	super tearDown.
]

{ #category : #tests }
OvinaEntityRelationsTest >> testDad [
	| lamb dad |
	lamb := OvinaLamb  at: 100.
	dad := lamb dad.
	self assert: dad name equals: 'Ingolf' 
]

{ #category : #tests }
OvinaEntityRelationsTest >> testDescriptionToEvents [
	"test that one can move from a description to its events"

	| desc event |
	desc := OvinaEventDescription  at: 77.
	event := (desc events select: [ :ev | ev id = 777 ]) first.
	self assert: event value equals: 'konge'
]

{ #category : #tests }
OvinaEntityRelationsTest >> testEventSheep [
	"test that one can move from event to the animal in question"

	| event sheep |
	event := OvinaEvent  at: 777.
	sheep := event sheep.
	self assert: sheep name equals: 'Bolche'.
]

{ #category : #tests }
OvinaEntityRelationsTest >> testEventToDescription [
	"test that one can move from event to description"

	| event desc |
	event := OvinaEvent  at: 777.
	desc := event description.
	self assert: desc descTag equals: 'flytning'.
]

{ #category : #tests }
OvinaEntityRelationsTest >> testEweOffspring [
	| ewe lamb |
	ewe := OvinaEwe  at: 1000.
	lamb := ewe offspring first.
	self assert: lamb number equals: 100.
]

{ #category : #tests }
OvinaEntityRelationsTest >> testMom [
	| lamb mom |
	lamb := OvinaLamb  at: 100.
	mom := lamb mother.
	self assert: mom name equals: 'Bolche'
]

{ #category : #tests }
OvinaEntityRelationsTest >> testRamOffspring [
	| ram lamb |
	ram := OvinaRam  at: 10.
	lamb := ram offspring first.
	self assert: lamb number equals: 100
]
