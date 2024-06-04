Class {
	#name : 'SindarinStepToNextBlockEvaluation',
	#superclass : 'SindarinCommand',
	#classTraits : '{} + TraitedClass',
	#instVars : [
		'errorString',
		'maxDepth'
	],
	#category : 'NewTools-Sindarin-Commands',
	#package : 'NewTools-Sindarin-Commands'
}

{ #category : 'initialization' }
SindarinStepToNextBlockEvaluation class >> defaultIconName [

	^ #changeUpdate
]

{ #category : 'accessing - defaults' }
SindarinStepToNextBlockEvaluation class >> defaultMaxDepth [

	^ 1000
]

{ #category : 'default' }
SindarinStepToNextBlockEvaluation class >> defaultName [
	<toolbarExtensionDebugCommand: 50>
	<codeExtensionDebugCommand: 50>
	^ 'Next block eval'
]

{ #category : 'accessing' }
SindarinStepToNextBlockEvaluation >> errorDuringSearchString [

	^ 'Search interrupted due to exception.'
]

{ #category : 'accessing' }
SindarinStepToNextBlockEvaluation >> errorString [

	^ errorString
]

{ #category : 'executing' }
SindarinStepToNextBlockEvaluation >> execute [

	| debugger scopes depth currentScope sender |
	debugger := self debuggerPresenter sindarinDebugger.
	self debuggerPresenter debuggerActionModel preventUpdatesDuring: [
		currentScope := debugger currentASTScope.
		sender := debugger context home sender.
		scopes := { currentScope } asSet.


		depth := 0.
		errorString := nil.
		debugger step.
		[
		((scopes includes:
			  (currentScope := debugger currentASTScope) outerScope) and: [
			 currentScope isBlockScope ]) or: [ errorString notNil ] ]
			whileFalse: [
				debugger step.
				depth := depth + 1.
				scopes add: currentScope.
				depth = self maxDepth ifTrue: [
					errorString := self notFoundErrorString ].
				debugger context == sender ifTrue: [
					errorString := self notFoundInCurrentContextString ].
				debugger hasSignalledUnhandledException ifTrue: [
					errorString := self errorDuringSearchString ] ] ].

	errorString ifNotNil: [
		self debuggerPresenter
			warning: errorString
			for: self debuggerPresenter toolbar ]
]

{ #category : 'accessing' }
SindarinStepToNextBlockEvaluation >> maxDepth [

	^ maxDepth ifNil: [ maxDepth := self class defaultMaxDepth ]
]

{ #category : 'accessing' }
SindarinStepToNextBlockEvaluation >> maxDepth: anObject [

	maxDepth := anObject
]

{ #category : 'accessing' }
SindarinStepToNextBlockEvaluation >> notFoundErrorString [

	^ 'No block evaluation found in 1000 debugger steps: try again to continue your search.'
]

{ #category : 'accessing' }
SindarinStepToNextBlockEvaluation >> notFoundInCurrentContextString [

	^ 'No block evaluation found in this context.'
]
