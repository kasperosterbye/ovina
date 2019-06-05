"
I implement loading from csv files.

I assume the following filenames:

rams.csv
ewes.csv
lambs.csv

They are files stored in the *path* instance variable


"
Class {
	#name : #OvinaCSVLoader,
	#superclass : #OvinaEntityLoader,
	#instVars : [
		'path'
	],
	#category : #'Ovina-ModelManager'
}

{ #category : #'instance creation' }
OvinaCSVLoader class >> on: aPath [
	"return a new loader which loads from aPath"
	^self new
		path: aPath;
		yourself
]

{ #category : #private }
OvinaCSVLoader >> classFor: sheepKind [
	(#('Ewe' 'Lamb' 'Ram') includes: sheepKind)
		ifTrue: [ ^ self class environment at: ('Ovina' , sheepKind) asSymbol ]
		ifFalse:[ OvinaCSVFormatError signal]
]

{ #category : #files }
OvinaCSVLoader >> eventDescriptorFile [
	^ (path , 'descriptors.csv') asFileReference readStream
]

{ #category : #files }
OvinaCSVLoader >> eventFile [
	^ (path , 'events.csv') asFileReference readStream
]

{ #category : #files }
OvinaCSVLoader >> eweFile [
	^ (path , 'ewes.csv') 
		asFileReference readStream.
]

{ #category : #initialization }
OvinaCSVLoader >> initialize [
	path := '/Users/kasper/_Projects/Pharo/ovina_csv/'.
]

{ #category : #files }
OvinaCSVLoader >> lambFile [
	^ (path , 'lambs.csv')  
		asFileReference readStream.
]

{ #category : #loading }
OvinaCSVLoader >> loadEventDescriptions [
	| neoReader |
	neoReader := NeoCSVReader on: self eventDescriptorFile.
	"descID descTag descDate descComment descSeason"
	neoReader
		separator: $;;
		recordClass: OvinaEventDescription;
		addIntegerField: #id:;
		addField: #descTag:;
		addField: #descDate: converter: [ :s | Date fromString: s ];
		addField: #descComment:;
		addIntegerField: #descSeason:;
		skipHeader.
	^ self newDictionaryOn: neoReader
]

{ #category : #loading }
OvinaCSVLoader >> loadEvents [
	| neoReader |
	neoReader := NeoCSVReader on: self eventFile.
	"eventID descFK sheepFK sheepKind eventDate value"
	neoReader
		separator: $;;
		recordClass: OvinaEvent;
		addIntegerField: #id:;
		addIntegerField: #descFK:;
		addIntegerField: #sheepFK:;
		addField: #sheepKind:
			converter: [ :kind | self classFor: kind ];
		addField: #eventDate: converter: [ :s | Date fromString: s ];
		addField: #value:;
		skipHeader.
	^ self newDictionaryOn: neoReader
]

{ #category : #loading }
OvinaCSVLoader >> loadEwes [
	| neoReader |
	neoReader := NeoCSVReader on: self eweFile.
	"eweID name chr number inDate race outDate"
	neoReader
		separator: $;;
		recordClass: OvinaEwe;
		addIntegerField: #id:;
		addField: #name:;
		addIntegerField: #chr:;
		addIntegerField: #number:;
		addField: #inDate: converter: [ :s | Date fromString: s ];
		addField: #race:;
		addField: #outDate: converter: [ :s | Date fromString: s ];
		skipHeader.
	^ self newDictionaryOn: neoReader
]

{ #category : #loading }
OvinaCSVLoader >> loadLambs [
	| neoReader |
	neoReader := NeoCSVReader on: self lambFile.
	"lambID number momFK dadFK inDate event sex growth usage color comment"
	neoReader
		separator: $;;
		recordClass: OvinaLamb;
		addIntegerField: #id:;
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
	^ self newDictionaryOn: neoReader
]

{ #category : #loading }
OvinaCSVLoader >> loadRams [
	| neoReader |
	neoReader := NeoCSVReader on: self ramFile.
	"'ramID' 'name' 'chr' 'number' 'inDate' 'race'"
	neoReader
		separator: $;;
		recordClass: OvinaRam;
		addIntegerField: #id:;
		addField: #name:;
		addIntegerField: #chr:;
		addIntegerField: #number:;
		addField: #inDate: converter: [ :s | Date fromString: s ];
		addField: #race:;
		skipHeader.
	^ self newDictionaryOn: neoReader
]

{ #category : #private }
OvinaCSVLoader >> newDictionaryOn: reader [
	| dict |
	dict := Dictionary new.
	reader upToEnd do: [ :ent | dict at: ent id put: ent].
	^ dict
]

{ #category : #initialization }
OvinaCSVLoader >> path: aPath [
	"override the hardcoded path in initialize - for example for testing"
	path := aPath
]

{ #category : #files }
OvinaCSVLoader >> ramFile [
	^ (path , 'rams.csv')  
		asFileReference readStream.
]
