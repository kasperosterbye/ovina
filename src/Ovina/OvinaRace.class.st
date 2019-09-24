"
The purpose of RaceFormat is to represent races of sheeps.
 The format is ""1S3T"" or ""1T1L"", or ""1S1T2L""
 The sum must be 1, 2, 4, 8, 16, ...
 S= Såne, T=Texel, etc (see the raceMap method)

My internal representation is a map where '1S1T2L' is represented as:
S->1, T->1, L->2, total: 4
this is decoded in the initialize method ()

From the the Java version: 
    public String computeRace() {
        if ( homeBreed() ) {
            if ( getMother() != null && getFather() != null ) {
                return RaceFormat.MergeRaces(
                        getMother().computeRace(),
                        getFather().computeRace() );
            } else {
                return RaceFormat.ExtractFormat( this.getRace() );
            }
        } else {
            return RaceFormat.ExtractFormat( this.getRace() );
        }
    }
"
Class {
	#name : #OvinaRace,
	#superclass : #Object,
	#instVars : [
		'raceString',
		'total',
		'map'
	],
	#classVars : [
		'raceMap'
	],
	#category : #'Ovina-Model'
}

{ #category : #private }
OvinaRace class >> new [
	"call one of the other new methods"
	self shouldNotImplement
]

{ #category : #'instance creation' }
OvinaRace class >> newFromFreeText: aString [
	"Assumes the races in the free text is done using upper case letters. - eg. TexelSåne"

	| raceLetters count res |
	raceLetters := (aString select: [ :c | c isUppercase ]) sort.
	count := 1.
	res := '' writeStream.
	2 to: raceLetters size do: [ :i | 
		(raceLetters at: i - 1) = (raceLetters at: i)
			ifTrue: [ count := count + 1 ]
			ifFalse: [ res
					<< count asString;
					<< (raceLetters at: i - 1).
				count := 1 ] ].
	res
		<< count asString;
		<< raceLetters last.
	^ self newFromString: res contents
]

{ #category : #private }
OvinaRace class >> newFromMap: aMap [
	^ self basicNew
		map: aMap;
		initializeFromMap;
		yourself
]

{ #category : #'instance creation' }
OvinaRace class >> newFromString: aRaceString [
	^ self basicNew
		raceString: aRaceString;
		initializeFromString;
		yourself
]

{ #category : #initialization }
OvinaRace >> * otherRace [
	| newMap big small scale |
	self total < otherRace total
		ifTrue: [ big := otherRace.
			small := self ]
		ifFalse: [ big := self.
			small := otherRace ].
	scale := big total / small total.
	newMap := big map copy.
	small map
		associationsDo: [ :binding | 
			newMap
				at: binding key
				put: (big map at: binding key ifAbsent: 0) + (binding value * scale) ].
	^ self class newFromMap: newMap
]

{ #category : #initialization }
OvinaRace >> initializeFromMap [
	self normalize
]

{ #category : #initialization }
OvinaRace >> initializeFromString [
	| run |
	total := 0.
	map := Dictionary new.
	run := 0.
	raceString
		do: [ :ch | 
			ch isDigit
				ifTrue: [ run := run * 10 + ch digitValue ]
				ifFalse: [ total := total + run.
					map at: ch put: run.
					run := 0  ].
			].
	self normalize.
]

{ #category : #accessing }
OvinaRace >> map [
	^ map
]

{ #category : #accessing }
OvinaRace >> map: anObject [
	map := anObject
]

{ #category : #initialization }
OvinaRace >> normalize [
	| lst gcd str |
	lst := map values.
	gcd := lst allButFirst inject: lst first into: [ :a :b | a gcd: b ].
	gcd > 1
		ifTrue: [ map
				associationsDo: [ :binding | map at: binding key put: binding value / gcd ] ].
	total := map values sum.
	str := '' writeStream.
	map keys sort
		do: [ :key | 
			str
				<< (map at: key) asString;
				<< key asString].
	raceString := str contents
]

{ #category : #printing }
OvinaRace >> printOn: aStream [
	aStream << raceString.
]

{ #category : #initialization }
OvinaRace >> raceMap [

	raceMap ifNil: [ 
		raceMap := Dictionary new
			at: $S put: 'Såne';
			at: $T put: 'Texel';
			at: $L put: 'Lyne';
			at: $Y put: 'Lleyn';
			at: $M put: 'Mårum';
			at: $U put: 'Ukendt';
			yourself
		 ].
	^ raceMap
]

{ #category : #accessing }
OvinaRace >> raceString [
	^ raceString
]

{ #category : #initialization }
OvinaRace >> raceString: aString [
	raceString := aString
]

{ #category : #accessing }
OvinaRace >> total [
	^ total
]
