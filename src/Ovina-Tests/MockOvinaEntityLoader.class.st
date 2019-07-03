"
I am a mock loader 
"
Class {
	#name : #MockOvinaEntityLoader,
	#superclass : #OvinaEntityLoader,
	#category : #'Ovina-Tests'
}

{ #category : #loading }
MockOvinaEntityLoader >> loadEventDescriptions [
	"return a collection of EventDescriptions"
	"descTag descDate descComment descSeason id"
	^ Dictionary new
		at: 77
		put: (OvinaEventDescription new
			id: 77;
			descTag: 'flytning';
			descDate: '2019-05-12' asDate;
			descComment: 'Marker1ForTest';
			descSeason: 2019;
			yourself);
		at: 78 
		put: (OvinaEventDescription new
			id: 78;
			descTag: 'Veje lam';
			descDate: '2019-05-12' asDate;
			descComment: 'Marker2ForTest';
			descSeason: 2019;
			yourself);
		yourself
]

{ #category : #loading }
MockOvinaEntityLoader >> loadEvents [
	"return a collection of Events"

	"descFK sheepFK sheepKind eventDate value id"

	^ Dictionary new
		at: 777
			put:
			(OvinaEvent new
				id: 777;
				descFK: 77; "Flytning"
				sheepFK: 1000;
				sheepKind: OvinaEwe;
				eventDate: '2019-05-12' asDate;
				value: 'konge'; 
				yourself);
		at: 888
			put:
			(OvinaEvent new
				id: 888;
				descFK: 77; "Flytning"
				sheepFK: 1000;
				sheepKind: OvinaEwe;
				eventDate: '2019-05-17' asDate;
				value: 'sæter';  
				yourself);
		at: 111
			put:
			(OvinaEvent new
				id: 111;
				descFK: 77; "Flytning"
				sheepFK: 100;
				sheepKind: OvinaLamb;
				eventDate: '2019-05-17' asDate;
				value: 'sæter';  
				yourself);
		at: 112
		put: (OvinaEvent new
				id: 112;
				descFK: 78; "Veje lam"
				sheepFK: 101;
				sheepKind: OvinaLamb;
				eventDate: '2019-04-20' asDate;
				value: '15';  
				yourself);
		yourself
]

{ #category : #loading }
MockOvinaEntityLoader >> loadEwes [
	"return a collection of Eves"

	"eweID;name;chr;number;inDate;race;outDate"

	^ Dictionary new
		at: 1000
			put:
			(OvinaEwe new
				id: 1000;
				name: 'Bolche';
				chr: 112633;
				number: 310;
				inDate: '2017-04-02' asDate;
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
			put:
			(OvinaLamb new
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
				yourself); "Veje lam test, en vejning efter 50 dage"
		at: 101
			put:
			(OvinaLamb new
				id: 101;
				number: 101;
				momFK: 1000;
				dadFK: 10;
				inDate: '2019-03-01' asDate;
				event: 'let';
				sex: 'gimmer';
				growth: -1;
				usage: 'avl';
				color: 'hvid';
				comment: 'En vejning';
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
