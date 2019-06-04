"
I am a mock loader 
"
Class {
	#name : #MockOvinaEntityLoader,
	#superclass : #OvinaEntityLoader,
	#category : #'Ovina-Tests'
}

{ #category : #loading }
MockOvinaEntityLoader >> loadEwes [
	"return a collection of Eves"

	"eweID;name;chr;number;inDate;race;outDate"

	^ Dictionary new 
		at: 1000
		put: (OvinaEwe new
		id: 1000;
		name: 'Bolche';
		chr: 112633;
		number: 310;
		inDate: '2017-04-02';
		race: 'Texel';
		outDate: nil;
		yourself);
		yourself
]

{ #category : #loading }
MockOvinaEntityLoader >> loadLambs [
	"return a collection of Lambs"

	^ Dictionary new 
		at: 100
		put: (OvinaLamb new
		id: 100;
		number: 100;
		momFK: 1000;
		dadFK: 10;
		inDate: '2018-03-28' asDate;
		event: 'let';
		sex: 'gimmer';
		growth: 150;
		usage: 'avl';
		color: 'hvid';
		comment: 'Nuser';
		yourself);
		yourself
		
]

{ #category : #loading }
MockOvinaEntityLoader >> loadRams [
	"return a collection of Rams"

	"ramId name chr number inDate race"

	^ Dictionary new 
		at: 10
		put:(OvinaRam new
		id: 10;
		name: 'Ingolf';
		number: 10;
		inDate: '2010-10-19' asDate;
		race: 'Texel';
		yourself);
		at: 20
		put:
	(OvinaRam new
		id: 20;
		name: 'Jensen';
		number: 20;
		inDate: '2013-9-19' asDate;
		race: 'Såne';
		yourself);
		yourself
]
