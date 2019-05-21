"
I represent the Ovina baseline.


"
Class {
	#name : #BaselineOfOvina,
	#superclass : #BaselineOf,
	#category : #BaselineOfOvina
}

{ #category : #'class initialization' }
BaselineOfOvina class >> initialize [
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
BaselineOfOvina >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			"packages"
			spec 
				package: 'Ovina';
				package: 'Ovina-Tests' with: [ spec requires: #('Ovina') ].
			"dependencies"
			self  neoCSVDependency: spec ]
]

{ #category : #baselines }
BaselineOfOvina >> neoCSVDependency: spec [
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
BaselineOfOvina >> projectClass [
	^ MetacelloCypressBaselineProject
]
