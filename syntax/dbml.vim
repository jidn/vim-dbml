" Vim syntax file
" Language:             Database Markup Language (DBML) https://dbml-lang.org
" Maintainer:           Clinton James
" Project Repository:   https://github/jidn/vim-dbml
" Last Change:          2019-09-01
" Version:              1.0
"
" The following settings are available for tuning sytax highlighting:
"   let dbml_nofold_blocks = 1

" quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn keyword dbmlKeyword Table TableGroup Enum Indexes Project
syn keyword dbmlBoolean false null true
syn keyword dbmlType  blob bool boolean char character date datetime decimal
syn keyword dbmlType  float json int integer long number numeric nvarchar ntext
syn keyword dbmlType  rowid smallint real text timestamp varchar
syn match dbmlType "int\(8\|16\|32\|64\|128\)"
syn keyword dbmlColSetting pk null unique increment
syn match dbmlColSetting "primary key"
syn match dbmlColSetting "not null"

" DBML Default:
syn match dbmlDefault "[dD]efault:" nextgroup=dbmlNumber,dbmlFloat,dbmlString,dbmlExpression,dbmlBoolean skipwhite

" DBML Ref:
syn match dbmlRef "[rR]ef:" nextgroup=dbmlRefOp,dbmlRefName skipwhite
syn match dbmlRefOp "\(<\|>\|-\)" nextgroup=dbmlRefName skipwhite
syn match dbmlRefName "\h\w*\.\h\w*"

" DBML Note:
syn match dbmlNoteMulti "[nN]ote:" contained nextgroup=dbmlNoteText,dbmlMultiLine skipwhite
syn match dbmlNote "[nN]ote:" contained nextgroup=dbmlNoteText skipwhite
syn region dbmlNoteText start=/'/ end=/'/ oneline

" Various Regions
syn region dbmlColString start=/"/ skip=/\\"/ end=/"/ oneline
syn region dbmlString start=/'/ skip=/\\'/ end=/'/ oneline
syn region dbmlExpression start=/`/ end=/`/ oneline
syn region dbmlMultiLine start=/'''/ end=/'''/ fold

" Numbers
syn match dbmlNumber "\d\+"
syn match dbmlNumber "[-+]\d\+"
syn match dbmlFloat "\d\+\.\d*"
syn match dbmlFloat "[-+]\d\+\.\d*"

" Comments
syn match dbmlComment "//.*$" contains=@Spell

" Bracketed Settings
syn region dbmlSettingBlock start="\[" end="\]" fold transparent contains=dbmlBoolean,dbmlColSetting,dbmlNumber,dbmlFloat,dbmlString,dbmlExpression,dbmlDefault,dbmlNote,dbmlRef

" Folding
if !exists('g:dbml_nofold_blocks')
    syn region dbmlBlock start=/{/ end=/}/ fold transparent
endif

" Define the default highlighting.
hi def link dbmlBlock       Block
hi def link dbmlComment     Comment
hi def link dbmlKeyword     Keyword
hi def link dbmlType        Type
hi def link dbmlBoolean     Boolean
hi def link dbmlNumber      Number
hi def link dbmlFloat       Float
hi def link dbmlBoolean     Special
hi def link dbmlString      String
hi def link dbmlColString   Statement
hi def link dbmlColSetting  Statement
hi def link dbmlExpression  Function
hi def link dbmlMultiLine   SpecialComment
hi def link dbmlNoteMulti   SpecialComment
hi def link dbmlNote        SpecialComment
hi def link dbmlNoteText    SpecialComment
hi def link dbmlDefault     Macro
hi def link dbmlRef         Macro
hi def link dbmlRefOp       Macro
hi def link dbmlRefName     Macro

setlocal commentstring=//\ %s
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

let b:current_syntax = "dbml"
