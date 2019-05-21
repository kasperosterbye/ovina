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
	#superclass : #OvinaSheepLoader,
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

{ #category : #loading }
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

{ #category : #loading }
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