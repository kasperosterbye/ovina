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
	^{
		OvinaEwe new 
			eweID: 1000;
			name: 'Bolche';
			chr: 112633;
			number: 310;
			inDate: '2017-04-02';
			race: 'Texel';
			outDate: nil;
			yourself.
	}
]

{ #category : #loading }
MockOvinaEntityLoader >> loadLambs [
	"return a collection of Lambs"
	^ { 
		OvinaLamb new
			"lambID number momFK dadFK inDate event sex growth usage color comment"
			lambID: 100; 
			number: 100;
			momFK:1000;
			dadFK: 10;
			inDate: '2018-03-28' asDate;
			event: 'let';
			sex: 'gimmer'; 
			growth: 150;
			usage: 'avl';
			color: 'hvid';
			comment: 'Nuser';
			yourself.
	 }
]

{ #category : #loading }
MockOvinaEntityLoader >> loadRams [
	"return a collection of Rams"
	"ramId name chr number inDate race"
	^ { 
		OvinaRam new
			ramId: 10;
			name: 'Ingolf';
			number: 10;
			inDate: '2010-10-19' asDate;
			race: 'Texel';
			yourself.
		OvinaRam new
			ramId: 20;
			name: 'Jensen';
			number: 20;
			inDate: '2013-9-19' asDate;
			race: 'Såne';
			yourself.
	}
]
