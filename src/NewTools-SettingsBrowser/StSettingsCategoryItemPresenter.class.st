"
Represents a single setting browser category item.

"
Class {
	#name : 'StSettingsCategoryItemPresenter',
	#superclass : 'StSettingsAbstractPresenter',
	#instVars : [
		'node',
		'labelPresenter',
		'iconPresenter'
	],
	#category : 'NewTools-SettingsBrowser-UI',
	#package : 'NewTools-SettingsBrowser',
	#tag : 'UI'
}

{ #category : 'layout' }
StSettingsCategoryItemPresenter >> defaultLayout [ 

	^ SpBoxLayout newTopToBottom 
		hAlignCenter;
		add: iconPresenter width: 35;
		add: labelPresenter;
		yourself
]

{ #category : 'accessing' }
StSettingsCategoryItemPresenter >> iconMapAt: aString [ 
	"Answer a <Symbol> representing an icon selector matching aString"

	^ self application iconMapAt: aString
]

{ #category : 'accessing' }
StSettingsCategoryItemPresenter >> iconPresenter [

	^ iconPresenter
]

{ #category : 'accessing' }
StSettingsCategoryItemPresenter >> iconPresenter: anObject [

	iconPresenter := anObject
]

{ #category : 'initialization' }
StSettingsCategoryItemPresenter >> initializePresenters [ 

	labelPresenter := self newLabel label: node label.
	iconPresenter := self iconNamed: (self iconMapAt: node name).

]

{ #category : 'accessing' }
StSettingsCategoryItemPresenter >> labelPresenter [

	^ labelPresenter
]

{ #category : 'accessing' }
StSettingsCategoryItemPresenter >> labelPresenter: anObject [

	labelPresenter := anObject
]

{ #category : 'accessing' }
StSettingsCategoryItemPresenter >> node [
	^ node
]

{ #category : 'accessing - model' }
StSettingsCategoryItemPresenter >> setModelBeforeInitialization: aSettingNode [

	node := aSettingNode
	
]
