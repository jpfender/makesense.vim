" Vim syntax file 
" Language: makeSense
" Maintainer: Jakob Pfender <jpfender@sics.se>
" URL: TBA
" Latest Revision: 2012 Oct 12

if exists("b:current_syntax")
	finish
endif

" keyword definitions
syn keyword mplError		goto const
syn keyword mplConditional	if else switch
syn keyword mplRepeat		while for do
syn keyword mplBoolean		true false
syn keyword mplConstant		null
syn keyword mplTypedef		this super
syn keyword mplOperator		new lnew gnew mnew instanceof
syn keyword mplType		boolean char byte short int long float
syn keyword mplType		double void
syn keyword mplStatement	return
syn keyword mplStorageClass	static synchronized transient volatile final strictfp serializable
syn keyword mplExceptions	throw try catch finally
syn keyword mplAssert		assert
syn keyword mplMethodDecl	synchronized throws
syn keyword mplClassDecl	extends implements interface
syn keyword mplClassDecl	enum
syn match   mplUserLabelRef	"\k\+" contained
syn keyword mplBranch		break continue nextgroup=mplUserLabelRef
syn keyword mplScopeDecl	public protected private abstract
syn keyword mplLang		GetTypeLocalAction GetLocationLocalAction DefaultACM Integer PerformanceStateLocalAction CO2SensingLocalAction PresenceDetectionLocalAction FanActuatorLocalAction Stream LN Program SimpleTell Thread System	
syn cluster mplTop add=mplLang
syn cluster mplClasses add=mplLang
syn keyword mplLangObject	clone equals finalize getClass hashCode
syn keyword mplLangObject	notify notifyAll toString wait
syn keyword mplTodo		contained TODO FIXME XXX

syn cluster mplTop add=mplError,mplError,mplBranch,mplLabelRegion,mplLabel,mplConditional,mplRepeat,mplBoolean,mplConstant,mplTypedef,mplOperator,mplType,mplType,mplStatement,mplStorageClass,mplAssert,mplExceptions,mplMethodDecl,mplClassDecl,mplClassDecl,mplClassDecl,mplScopeDecl,mplError,mplUserLabel,mplLangObject

" matching
syn match   mplCharacter	"'[^']*'"
syn match   mplCharacter	"'\\''"
syn match   mplCharacter	"'[^\\]'"
syn match   mplNumber		"\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   mplNumber		"\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   mplNumber		"\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   mplNumber		"\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

syn cluster mplTop add=mplString,mplCharacter,mplNumber

" Regions and comments
syn region mplFold start="{" end="}" transparent fold
syn region  mplLabelRegion	transparent matchgroup=mplLabel start="\<case\>" matchgroup=NONE end=":" contains=mplNumber,mplCharacter
syn match   mplUserLabel	"^\s*[_$a-zA-Z][_$a-zA-Z0-9_]*\s*:"he=e-1 contains=mplLabel
syn keyword mplLabel		default
syn region  mplComment		start="/\*"  end="\*/" contains=mplTodo
syn match   mplCommentStar	 contained "^\s*\*[^/]"me=e-1
syn match   mplCommentStar	 contained "^\s*\*$"
syn match   mplLineComment	 "//.*" contains=mplTodo
syn match   mplSpecialError	 contained "\\."
syn match   mplSpecialChar	 contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"
syn region  mplString		start=+"+ end=+"+ end=+$+ contains=mplSpecialChar,mplSpecialError

" Functions
syn match  mplFuncDef "^\(\t\| \{8\}\)[_$a-zA-Z][_$a-zA-Z0-9_. \[\]]*([^-+*/()]*)" contains=mplScopeDecl,mplType,mplStorageClass,@mplClasses
syn region mplFuncDef start=+^\(\t\| \{8\}\)[$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*,\s*+ end=+)+ contains=mplScopeDecl,mplType,mplStorageClass,mplClasses
syn match  mplFuncDef "^  [$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*)" contains=mplScopeDecl,mplType,mplStorageClass,@mplClasses
syn region mplFuncDef start=+^  [$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*,\s*+ end=+)+ contains=mplScopeDecl,mplType,mplStorageClass,@mplClasses
syn match  mplBraces  "[{}]"
syn cluster mplTop add=mplFuncDef,mplBraces

" Parentheses
syn region  mplParenT	transparent matchgroup=mplParen  start="("  end=")" contains=@mplTop,mplParenT1
syn region  mplParenT1 transparent matchgroup=mplParen1 start="(" end=")" contains=@mplTop,mplParenT2 contained
syn region  mplParenT2 transparent matchgroup=mplParen2 start="(" end=")" contains=@mplTop,mplParenT  contained
syn match   mplParenError	 ")"
syn region  mplParenT	transparent matchgroup=mplParen  start="\["  end="\]" contains=@mplTop,mplParenT1
syn region  mplParenT1 transparent matchgroup=mplParen1 start="\[" end="\]" contains=@mplTop,mplParenT2 contained
syn region  mplParenT2 transparent matchgroup=mplParen2 start="\[" end="\]" contains=@mplTop,mplParenT  contained
syn match   mplParenError	 "\]"

" Highlighting
let b:current_syntax = "makesense"

hi def link mplFuncDef		Function
hi def link mplBraces		Function
hi def link mplBranch		Conditional
hi def link mplUserLabelRef	mplUserLabel
hi def link mplLabel		Label
hi def link mplUserLabel	Label
hi def link mplConditional	Conditional
hi def link mplRepeat		Repeat
hi def link mplExceptions	Exception
hi def link mplAssert		Statement
hi def link mplStorageClass	StorageClass
hi def link mplMethodDecl	mplStorageClass
hi def link mplClassDecl	mplStorageClass
hi def link mplScopeDecl	mplStorageClass
hi def link mplBoolean		Boolean
hi def link mplString		String
hi def link mplCharacter	Character
hi def link mplNumber		Number
hi def link mplError		Error
hi def link mplStatement	Statement
hi def link mplOperator		Operator
hi def link mplComment		Comment
hi def link mplLineComment	Comment
hi def link mplConstant		Constant
hi def link mplTypedef		Typedef
hi def link mplTodo		Todo

hi def link mplCommentStar	mplComment

hi def link mplType		Type

hi def link mplParenError	mplError
