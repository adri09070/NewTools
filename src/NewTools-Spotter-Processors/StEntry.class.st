"
I wrap the return elements from the spotter processor. 
As the processor returns different elements I add the behaviour required to show the element. 

Also, I redirect the messages that should be answer by my content
"
Class {
	#name : 'StEntry',
	#superclass : 'Object',
	#instVars : [
		'content'
	],
	#category : 'NewTools-Spotter-Processors-Entries',
	#package : 'NewTools-Spotter-Processors',
	#tag : 'Entries'
}

{ #category : 'testing' }
StEntry class >> isAbstract [ 

	^ self == StEntry
]

{ #category : 'wrapping' }
StEntry class >> on: aValue [
	
	^ self new
		content: aValue;
		yourself
]

{ #category : 'comparing' }
StEntry >> = anEntry [

	^ self species = anEntry species
		and: [ anEntry content = self content ]
]

{ #category : 'converting' }
StEntry >> asString [ 

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
StEntry >> content [
	^ content
]

{ #category : 'accessing' }
StEntry >> content: anObject [
	content := anObject
]

{ #category : 'spotter-extensions' }
StEntry >> displayString [

	^ self asString
]

{ #category : 'evaluating' }
StEntry >> doEvaluate [ 

	self subclassResponsibility 
]

{ #category : 'evaluating' }
StEntry >> evaluateFor: aSpotter [ 

	self doEvaluate
]

{ #category : 'comparing' }
StEntry >> hash [

	^ content hash
]

{ #category : 'accessing' }
StEntry >> iconName [
	
	^ self subclassResponsibility
]

{ #category : 'accessing' }
StEntry >> iconOn: anIconProvider [

	^ anIconProvider iconNamed: self iconName
]

{ #category : 'accessing' }
StEntry >> label [

	^ self asString
]

{ #category : 'testing' }
StEntry >> matchesText: aString [

	^ self asString = aString
]

{ #category : 'printing' }
StEntry >> printOn: aStream [

	super printOn: aStream.	
	aStream
		<< '( ';
		print: content;
		<< ' )'
]

{ #category : 'accessing' }
StEntry >> spotterPreview [

	^ (content spotterPreview: (SpPresenterBuilder newApplication: StPharoApplication current))
		addStyle: 'stSpotterPreview';
		yourself
]

{ #category : 'spotter-extensions' }
StEntry >> stSpotterProcessorsFor: aSpotterStep [

	^ content stSpotterProcessorsFor: aSpotterStep
]
