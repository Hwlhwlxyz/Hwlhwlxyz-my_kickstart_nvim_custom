" Vim color file
" penumbra-highcontrast
" Created by Hwlhwlxyz with ThemeCreator (https://github.com/mswift42/themecreator)

hi clear

if exists("syntax on")
syntax reset
endif

set t_Co=256
let g:colors_name = "penumbra-highcontrast"


" Define reusable colorvariables.
let s:bg="#FFF7ED"
let s:fg="#2c3035"
let s:fg2="#3d4145"
let s:fg3="#4e5155"
let s:fg4="#5f6265"
let s:bg2="#eee8d5"
let s:bg3="#d6cfc7"
let s:bg4="#c2bcb4"
let s:keyword="#aa3731"
let s:builtin="#2a55a8"
let s:const= "#3375b7"
let s:comment="#707070"
let s:func="#2a55a8"
let s:str="#3a8b65"
let s:type="#007d88"
let s:var="#8c4475"
let s:warning="#ff0000"
let s:warning2="#f48100"

exe 'hi Normal guifg='s:fg' guibg='s:bg
exe 'hi Cursor guifg='s:bg' guibg='s:fg
exe 'hi CursorLine  guibg='s:bg2
exe 'hi CursorLineNr guifg='s:str' guibg='s:bg
exe 'hi CursorColumn  guibg='s:bg2
exe 'hi ColorColumn  guibg='s:bg2
exe 'hi FoldColumn guifg='s:comment' guibg='s:bg2
exe 'hi SignColumn guifg='s:comment' guibg='s:bg2
exe 'hi LineNr guifg='s:fg2' guibg='s:bg2
exe 'hi CursorLineNr guifg='s:fg' guibg='s:bg2
exe 'hi VertSplit guifg='s:fg3' guibg='s:bg3
exe 'hi MatchParen guifg='s:warning2'  gui=underline'
exe 'hi StatusLine guifg='s:fg2' guibg='s:bg3' gui=bold'
exe 'hi Pmenu guifg='s:fg' guibg='s:bg2
exe 'hi PmenuSel  guibg='s:bg3
exe 'hi IncSearch guifg='s:bg' guibg='s:keyword
exe 'hi Search   gui=underline'
exe 'hi Directory guifg='s:const
exe 'hi Folded guifg='s:fg4' guibg='s:bg
exe 'hi WildMenu guifg='s:str' guibg='s:bg

exe 'hi Boolean guifg='s:const
exe 'hi Character guifg='s:const
exe 'hi Comment guifg='s:comment
exe 'hi Conditional guifg='s:keyword
exe 'hi Constant guifg='s:const
exe 'hi Todo guibg='s:bg
exe 'hi Define guifg='s:keyword
exe 'hi DiffAdd guifg=#000000 guibg=#bef6dc gui=bold'
exe 'hi DiffDelete guifg='s:bg2
exe 'hi DiffChange  guibg=#5b76ef guifg=#ffffff'
hi DiffText guifg=#ffffff guibg=#ff0000 gui=bold
exe 'hi ErrorMsg guifg='s:warning' guibg='s:bg2' gui=bold'
exe 'hi WarningMsg guifg='s:fg' guibg='s:warning2
exe 'hi Float guifg='s:const
exe 'hi Function guifg='s:func
exe 'hi Identifier guifg='s:type'  gui=italic'
exe 'hi Keyword guifg='s:keyword'  gui=bold'
exe 'hi Label guifg='s:var
"exe 'hi NonText guifg='s:bg4' guibg='s:bg2 " 没有字符的地方不需要改变颜色 
exe 'hi Number guifg='s:const
exe 'hi Operator guifg='s:keyword
exe 'hi PreProc guifg='s:keyword
exe 'hi Special guifg='s:fg
exe 'hi SpecialKey guifg='s:fg2' guibg='s:bg2
exe 'hi Statement guifg='s:keyword
exe 'hi StorageClass guifg='s:type'  gui=italic'
exe 'hi String guifg='s:str
exe 'hi Tag guifg='s:keyword
exe 'hi Title guifg='s:fg'  gui=bold'
exe 'hi Todo guifg='s:fg2'  gui=inverse,bold'
exe 'hi Type guifg='s:type
exe 'hi Underlined   gui=underline'

" Neovim Terminal Mode
let g:terminal_color_0 = s:bg
let g:terminal_color_1 = s:warning
let g:terminal_color_2 = s:keyword
let g:terminal_color_3 = s:bg4
let g:terminal_color_4 = s:func
let g:terminal_color_5 = s:builtin
let g:terminal_color_6 = s:fg3
let g:terminal_color_7 = s:str
let g:terminal_color_8 = s:bg2
let g:terminal_color_9 = s:warning2
let g:terminal_color_10 = s:fg2
let g:terminal_color_11 = s:var
let g:terminal_color_12 = s:type
let g:terminal_color_13 = s:const
let g:terminal_color_14 = s:fg4
let g:terminal_color_15 = s:comment

" Ruby Highlighting
exe 'hi rubyAttribute guifg='s:builtin
exe 'hi rubyLocalVariableOrMethod guifg='s:var
exe 'hi rubyGlobalVariable guifg='s:var' gui=italic'
exe 'hi rubyInstanceVariable guifg='s:var
exe 'hi rubyKeyword guifg='s:keyword
exe 'hi rubyKeywordAsMethod guifg='s:keyword' gui=bold'
exe 'hi rubyClassDeclaration guifg='s:keyword' gui=bold'
exe 'hi rubyClass guifg='s:keyword' gui=bold'
exe 'hi rubyNumber guifg='s:const

" Python Highlighting
exe 'hi pythonBuiltinFunc guifg='s:builtin

" Go Highlighting
exe 'hi goBuiltins guifg='s:builtin
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints      = 1
let g:go_highlight_chan_whitespace_error  = 1
let g:go_highlight_extra_types            = 1
let g:go_highlight_fields                 = 1
let g:go_highlight_format_strings         = 1
let g:go_highlight_function_calls         = 1
let g:go_highlight_function_parameters    = 1
let g:go_highlight_functions              = 1
let g:go_highlight_generate_tags          = 1
let g:go_highlight_operators              = 1
let g:go_highlight_space_tab_error        = 1
let g:go_highlight_string_spellcheck      = 1
let g:go_highlight_types                  = 1
let g:go_highlight_variable_assignments   = 1
let g:go_highlight_variable_declarations  = 1

" Javascript Highlighting
exe 'hi jsBuiltins guifg='s:builtin
exe 'hi jsFunction guifg='s:keyword' gui=bold'
exe 'hi jsGlobalObjects guifg='s:type
exe 'hi jsAssignmentExps guifg='s:var

" Html Highlighting
exe 'hi htmlLink guifg='s:var' gui=underline'
exe 'hi htmlStatement guifg='s:keyword
exe 'hi htmlSpecialTagName guifg='s:keyword

" Markdown Highlighting
exe 'hi mkdCode guifg='s:builtin

" more settings
hi Visual term=reverse cterm=reverse guibg=#ffd9aa


" neotree
hi NeoTreeCursorLine guibg=#ffffff
hi NeoTreeFileNameOpened guibg=#c4d9b1

" eyeliner.nvim
"highlight EyelinerPrimary guifg=#ff0000 gui=underline,bold
"highlight EyelinerSecondary guifg=#f48100 gui=underline


" https://github.com/petertriho/nvim-scrollbar
" Scrollbar highlight groups
hi ScrollbarHandle         guifg=NONE      guibg=#c2bcb4
hi ScrollbarCursorHandle   guifg=NONE      guibg=#8c4475
hi ScrollbarCursor         guifg=NONE      guibg=#8c4475
hi ScrollbarSearchHandle   guifg=NONE      guibg=#f48100
hi ScrollbarSearch         guifg=NONE      guibg=#fff7ed
hi ScrollbarErrorHandle    guifg=NONE      guibg=#ff0000
hi ScrollbarError          guifg=NONE      guibg=#ff0000
hi ScrollbarWarnHandle     guifg=NONE      guibg=#f48100
hi ScrollbarWarn           guifg=NONE      guibg=#f48100
hi ScrollbarInfoHandle     guifg=NONE      guibg=#2a55a8
hi ScrollbarInfo           guifg=NONE      guibg=#2a55a8
hi ScrollbarHintHandle     guifg=NONE      guibg=#007d88
hi ScrollbarHint           guifg=NONE      guibg=#007d88
hi ScrollbarMiscHandle     guifg=NONE      guibg=#3375b7
hi ScrollbarMisc           guifg=NONE      guibg=#3375b7
hi ScrollbarGitAdd         guifg=NONE      guibg=#3a8b65
hi ScrollbarGitAddHandle   guifg=NONE      guibg=#3a8b65
hi ScrollbarGitChange      guifg=NONE      guibg=#2a55a8
hi ScrollbarGitChangeHandle guifg=NONE     guibg=#2a55a8
hi ScrollbarGitDelete      guifg=NONE      guibg=#aa3731
hi ScrollbarGitDeleteHandle guifg=NONE     guibg=#aa3731