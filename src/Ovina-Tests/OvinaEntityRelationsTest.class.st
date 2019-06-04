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
	OvinaSheep managersReset
]

{ #category : #tests }
OvinaEntityRelationsTest >> testMom [
	| lamb mom |
	OvinaLamb loadLambs.
	lamb := OvinaLamb manager at: 100.
	mom := lamb mother.
	self assert: mom name equals: 'Bolche'
]
