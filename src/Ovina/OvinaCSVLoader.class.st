"
I implement loading from csv files


"
Class {
	#name : #OvinaCSVLoader,
	#superclass : #OvinaSheepLoader,
	#instVars : [
		'ramFile',
		'lambFile',
		'eveFile'
	],
	#category : #'Ovina-ModelManager'
}

{ #category : #accessing }
OvinaCSVLoader >> eweFile [
	^ eveFile 
		asFileReference readStream.
]

{ #category : #initialization }
OvinaCSVLoader >> initialize [
	ramFile := '/Users/kasper/_Projects/Pharo/ovina_csv/rams.csv'.
	lambFile := '/Users/kasper/_Projects/Pharo/ovina_csv/lambs.csv'.
	eveFile := nil
]

{ #category : #accessing }
OvinaCSVLoader >> lambFile [
	^ lambFile 
		asFileReference readStream.
]

{ #category : #'instance manager' }
OvinaCSVLoader >> loadEwes [ 
	| neoReader |
	neoReader := NeoCSVReader on: self eweFile.
	"eweID name chr number inDate race outDate"
	neoReader
		separator: $;;
		recordClass: OvinaEwe;
		addIntegerField: #eweID:;
		addField: #name:;
		addIntegerField: #chr:;
		addIntegerField: #number:;
		addField: #inDate: converter: [ :s | Date fromString: s ];
		addField: #race:;
		addField: #outDate: converter: [ :s | Date fromString: s ];
		skipHeader.
	^ neoReader upToEnd
]

{ #category : #'instance manager' }
OvinaCSVLoader >> loadLambs [
	| neoReader |
	neoReader := NeoCSVReader on: self lambFile.
	"lambID number momFK dadFK inDate event sex growth usage color comment"
	neoReader
		separator: $;;
		recordClass: OvinaLamb ;
		addIntegerField: #lambID:;
		addIntegerField: #number:;
		addIntegerField: #momFK:;
		addIntegerField: #dadFK:;
		addField: #inDate: converter: [ :s | Date fromString: s ];
		addField: #event:;
		addField: #sex:;
		addIntegerField: #growth:;
		addField: #usage:;
		addField: #color:;
		addField: #comment:;
		skipHeader.
	^ neoReader upToEnd
]

{ #category : #'instance manager' }
OvinaCSVLoader >> loadRams [
	| neoReader |
	neoReader := NeoCSVReader on: self ramFile.
	"'ramID' 'name' 'chr' 'number' 'inDate' 'race'"
	neoReader
		separator: $;;
		recordClass: OvinaRam;
		addIntegerField: #ramId:;
		addField: #name:;
		addIntegerField: #chr:;
		addIntegerField: #number:;
		addField: #inDate: converter: [ :s | Date fromString: s ];
		addField: #race:;
		skipHeader.
	^ neoReader upToEnd
]

{ #category : #accessing }
OvinaCSVLoader >> ramFile [
	^ ramFile 
		asFileReference readStream.
]
