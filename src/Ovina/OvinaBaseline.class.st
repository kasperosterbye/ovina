"
I represent the Ovina baseline.


"
Class {
	#name : #OvinaBaseline,
	#superclass : #BaselineOf,
	#category : #Ovina
}

{ #category : #'class initialization' }
OvinaBaseline class >> initialize [
	"I represent the baseline for Ovina.
	I am not sure I need this stuff.
	I depend on NeoCSV.
	"
	Gofer it
   smalltalkhubUser: 'SvenVanCaekenberghe' project: 'Neo';
   configurationOf: 'NeoCSV';
   loadStable.

	
]

{ #category : #baselines }
OvinaBaseline >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self neoCSVDependency: spec ]
]

{ #category : #baselines }
OvinaBaseline >> neoCSVDependency: spec [
"Gofer it
   smalltalkhubUser: 'SvenVanCaekenberghe' project: 'Neo';
   configurationOf: 'NeoCSV';
   loadStable."
	spec
		project: 'Neo'
		with: [ 
			spec
				className: #ConfigurationOfNeoCSV;
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/Neo/main' ]
]

{ #category : #accessing }
OvinaBaseline >> projectClass [
	^ MetacelloCypressBaselineProject
]
