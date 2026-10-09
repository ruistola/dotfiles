" Vim syntax file
" Language:    Cooper (https://github.com/ruistola/cooper)
" Maintainer:  throwaway: delete the cooper.nvim directory to discard
"
" Classic regex highlighting. It links to the standard groups, so the active
" colorscheme decides the colors. Keywords and token shapes follow the
" compiler's lexer (crates/cooper-frontend/src/lexer.rs).

if exists("b:current_syntax")
  finish
endif

syn case match

" Priority: a keyword beats a match at the same position, and among matches the
" one defined last wins. Order below is therefore general first, specific last.

" Comments ---------------------------------------------------------------
syn keyword cooperTodo contained TODO FIXME XXX NOTE
syn match   cooperComment "#.*$" contains=cooperTodo,@Spell

" Strings ----------------------------------------------------------------
syn match  cooperEscape contained +\\[ntr0\\"']+
syn region cooperString start=+"+ skip=+\\.+ end=+"+ contains=cooperEscape,@Spell

" Numbers ----------------------------------------------------------------
syn match cooperNumber "\<[0-9]\(_\?[0-9]\)*\>"
syn match cooperNumber "\<0[xX][0-9a-fA-F]\(_\?[0-9a-fA-F]\)*\>"
syn match cooperNumber "\<0[bB][01]\(_\?[01]\)*\>"
syn match cooperFloat  "\<[0-9]\(_\?[0-9]\)*\.[0-9]\(_\?[0-9]\)*\([eE][+-]\?[0-9]\(_\?[0-9]\)*\)\?\>"
syn match cooperFloat  "\<[0-9]\(_\?[0-9]\)*[eE][+-]\?[0-9]\(_\?[0-9]\)*\>"

" Keywords ---------------------------------------------------------------
syn keyword cooperKeyword     func struct oneof let use as
syn keyword cooperConditional if then else match with
syn keyword cooperRepeat      for in do while until repeat
syn keyword cooperStatement   break continue return
syn keyword cooperWordOp      and or xor
syn keyword cooperBoolean     true false
syn keyword cooperNil         nil
syn keyword cooperPrimitive   i8 i16 i32 i64 u8 u16 u32 u64 f32 f64 bool string

" Names ------------------------------------------------------------------
" A PascalCase identifier is a type, a type parameter, or a sum-type variant.
syn match cooperType      "\<[A-Z][A-Za-z0-9_]*\>"
syn match cooperWildcard  "\<_\>"
" A name annotated with `:` (parameter, member, `let`), but not `:=`.
syn match cooperDeclName  "\<[a-z_][A-Za-z0-9_]*\ze\s*:\%(=\)\@!"
" Member access `.name`, but not the second dot of a range `..name`.
syn match cooperField     "\%(\.\)\@<!\.\zs[a-z_][A-Za-z0-9_]*"
" A call is a name directly before `(`; a declaration name follows `func`.
syn match cooperCall      "\<[a-z_][A-Za-z0-9_]*\ze\s*("
syn match cooperFuncDef   "\%(\<func\s\+\)\@<=[A-Za-z_][A-Za-z0-9_]*"

" Operators and punctuation ----------------------------------------------
syn match cooperDelimiter "[,;:(){}\[\]]"
syn match cooperOperator  "[-+*/%!<>=]"
syn match cooperOperator  "[-+*/!<>=]="
syn match cooperOperator  ":="
syn match cooperOperator  "=>"
syn match cooperOperator  "\.\.=\?"
syn match cooperOperator  "[&^]"

" Links ------------------------------------------------------------------
hi def link cooperTodo        Todo
hi def link cooperComment     Comment
hi def link cooperEscape      SpecialChar
hi def link cooperString      String
hi def link cooperNumber      Number
hi def link cooperFloat       Float
hi def link cooperKeyword     Keyword
hi def link cooperConditional Conditional
hi def link cooperRepeat      Repeat
hi def link cooperStatement   Statement
hi def link cooperWordOp      Conditional
hi def link cooperBoolean     Boolean
hi def link cooperNil         Constant
hi def link cooperPrimitive   Type
hi def link cooperType        Type
hi def link cooperWildcard    Special
hi def link cooperDeclName    Identifier
hi def link cooperField       Identifier
hi def link cooperCall        Function
hi def link cooperFuncDef     Function
hi def link cooperOperator    Operator
hi def link cooperDelimiter   Delimiter

let b:current_syntax = "cooper"
