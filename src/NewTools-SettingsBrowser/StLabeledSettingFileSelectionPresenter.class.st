"
Provides a Spec presenter with:

- A label
- An input text displaying a directory.
- A button to select a directory which will update the input text when changed.

"
Class {
	#name : 'StLabeledSettingFileSelectionPresenter',
	#superclass : 'StLabeledSettingDirectorySelectionPresenter',
	#category : 'NewTools-SettingsBrowser-Widgets',
	#package : 'NewTools-SettingsBrowser',
	#tag : 'Widgets'
}

{ #category : 'examples' }
StLabeledSettingFileSelectionPresenter class >> example [

	^ (self 
		label: 'Label Example' 
		input: SpTextPresenter new
		description: 'Description string') open

]

{ #category : 'initialization' }
StLabeledSettingFileSelectionPresenter >> initializePresenters [ 

	super initializePresenters.
	selectButtonPresenter := self newButton
		label: 'Select File';
		action: [ 
			| selectedFile |
			((selectedFile := StOpenFilePresenter new openModal) isNotNil and: [ selectedFile isFile ])
				ifTrue: [ 
					self input 
						text: selectedFile fullName;
						help: selectedFile fullName ] ];
		yourself
]
