" Vim syntax file
" This is revision 719aae2
" Language:	RSL
" Version: 1.0
" Last Change:	2009/11/15 15:29:30
" Maintainer:  Edward Hades <hades@lvk.cs.msu.su>

" Contributors: 

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn sync lines=250

syn keyword rslBoolean          true false chaos
syn keyword rslConditional      if else elsif then case of
syn keyword rslTypeModifier     set infset list inflist
syn keyword rslLoop             while until for do
syn keyword rslOperator         all exists let in is as inter union isin card
syn keyword rslOperator         hd tl elems inds len dom rng out
syn keyword rslAccess           write read local
syn keyword rslStatement        scheme class channel value axiom post pre type end
syn keyword rslStatement        variable
syn keyword rslProcess          stop skip
syn keyword rslType             Real Nat Int Bool Text Char Unit

syn keyword rslTodo contained	TODO FIXME XXX DEBUG NOTE

syn region  rslString matchgroup=rslString start=+'+ end=+'+ contains=rslStringEscape
syn region  rslString matchgroup=rslString start=+"+ end=+"+ contains=rslStringEscapeGPC
syn match   rslStringEscape	contained "''"
syn match   rslStringEscapeGPC	contained '""'

syn match  rslNumber		"-\=\<\d\+\>"
syn match  rslFloat		"-\=\<\d\+\.\d\+\>"
syn match  rslFloat		"-\=\<\d\+\.\d\+[eE]-\=\d\+\>"

syn match  rslMultiSymbol       "\\/"
syn match  rslMultiSymbol       "/\\"
syn match  rslMultiSymbol       ":-"
syn match  rslMultiSymbol       "><"
syn match  rslMultiSymbol       "=>"
syn match  rslMultiSymbol       "->"
syn match  rslMultiSymbol       "+>"
syn match  rslMultiSymbol       "-m->"
syn match  rslMultiSymbol       "-\~->"
syn match  rslMultiSymbol       "<\.\|\.>"
syn match  rslMultiSymbol       "{|\||}"

syn region rslComment	start="/\*"  end="\*/" contains=rslTodo

if version >= 508 || !exists("did_rsl_syn_inits")
  if version < 508
    let did_rsl_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink rslAccess		rslStatement
  HiLink rslBoolean		Boolean
  HiLink rslComment		Comment
  HiLink rslConditional	Conditional
  HiLink rslFloat		Float
  HiLink rslFunction		Function
  HiLink rslProcess	Identifier
  HiLink rslTypeModifier		Type
  HiLink rslNumber		Number
  HiLink rslOperator		Operator
  HiLink rslMultiSymbol         rslOperator
  HiLink rslLoop		Repeat
  HiLink rslStatement	Statement
  HiLink rslString		String
  HiLink rslStringEscape	Special
  HiLink rslStringEscapeGPC	Special
  HiLink rslTodo		Todo
  HiLink rslType		Type

  delcommand HiLink
endif


let b:current_syntax = "rsl"

" vim: ts=8 sw=2
