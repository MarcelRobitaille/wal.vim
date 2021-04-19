" wal.vim -- Vim color scheme.
" Author:       Dylan Araps
" Webpage:      https://github.com/dylanaraps/wal
" Description:  A colorscheme that uses your terminal colors, made to work with 'wal'.

hi clear
set background=dark

if exists('syntax_on')
	syntax reset
endif

" Colorscheme name
let g:colors_name = 'wal'


" highlight groups {{{

function! SetHighlight(string)
	let l:guioptions = ' '

	if exists('g:wal_colors') && len(g:wal_colors) >= 16
		for part in split(a:string)
			let code = substitute(part, '.*=', '', '')
			let part = substitute(part, code, '', '')
			for match in ['ctermbg=', 'ctermfg=', 'cterm=']
				if part == match
					let part = substitute(part, 'cterm', 'gui', '')
					let l:guioptions .= ' ' . part .
								\ get(g:wal_colors, code, code)
				endif
			endfor
		endfor
	endif

	execute a:string . l:guioptions
endfunction

call SetHighlight('hi Normal ctermbg=0 ctermfg=7')
call SetHighlight('hi NormalFloat ctermbg=0 ctermfg=7')
call SetHighlight('hi NormalNc ctermbg=0 ctermfg=7')

" "Box-in" the nromal content window by seting it as a darker colour to
" everything else
" This is nice to see the textwidth in a prettier way than a single vertical
" line
" Here, I am using 1000 as a hack
" Turns out giving vim a color > 255 results in terminal background color

" Make everything past textwidth have the same background as terminal
call SetHighlight('hi ColorColumn ctermbg=1000 guibg=NONE')

" This is the cmdline in neovim
" Does not exist in vim
call SetHighlight('hi MsgArea ctermbg=1000')

" Below the end of the file (nvim and vim>=8)
call SetHighlight('hi EndOfBuffer ctermbg=1000 ctermfg=8')

" Highlight nontext like comments
" Includes invisible characters like `listchars`
call SetHighlight('hi NonText ctermbg=NONE ctermfg=0 cterm=NONE')

call SetHighlight('hi Comment ctermbg=NONE ctermfg=8')
call SetHighlight('hi Constant ctermbg=NONE ctermfg=3')
call SetHighlight('hi Error ctermbg=1 ctermfg=7')
call SetHighlight('hi Identifier ctermbg=NONE ctermfg=1 cterm=BOLD')
call SetHighlight('hi Ignore ctermbg=8 ctermfg=0')
call SetHighlight('hi PreProc ctermbg=NONE ctermfg=3')
call SetHighlight('hi Special ctermbg=NONE ctermfg=6')
call SetHighlight('hi Statement ctermbg=NONE ctermfg=1')
call SetHighlight('hi String ctermbg=NONE ctermfg=2')
call SetHighlight('hi Number ctermbg=NONE ctermfg=3')
call SetHighlight('hi Todo ctermbg=2 ctermfg=0')
call SetHighlight('hi Type ctermbg=NONE ctermfg=3')
call SetHighlight('hi Underlined ctermbg=NONE ctermfg=1 cterm=underline')
call SetHighlight('hi StatusLine ctermbg=7 ctermfg=0')
call SetHighlight('hi StatusLineNC ctermbg=8 ctermfg=0')
call SetHighlight('hi TabLine ctermbg=NONE ctermfg=8')
call SetHighlight('hi TabLineFill ctermbg=NONE ctermfg=8')
call SetHighlight('hi TabLineSel ctermbg=4 ctermfg=0')
call SetHighlight('hi TermCursorNC ctermbg=3 ctermfg=0')
call SetHighlight('hi VertSplit ctermbg=8 ctermfg=0')
call SetHighlight('hi Title ctermbg=NONE ctermfg=4')
call SetHighlight('hi CursorLine ctermbg=8 ctermfg=0')
call SetHighlight('hi LineNr ctermbg=NONE ctermfg=8')
call SetHighlight('hi CursorLineNr ctermbg=NONE ctermfg=8')
call SetHighlight('hi helpLeadBlank ctermbg=NONE ctermfg=7')
call SetHighlight('hi helpNormal ctermbg=NONE ctermfg=7')
call SetHighlight('hi Visual ctermbg=NONE ctermfg=15 cterm=reverse term=reverse')
call SetHighlight('hi VisualNOS ctermbg=NONE ctermfg=1')
call SetHighlight('hi Pmenu ctermbg=8 ctermfg=7')
call SetHighlight('hi PmenuSbar ctermbg=6 ctermfg=7')
call SetHighlight('hi PmenuSel ctermbg=4 ctermfg=0')
call SetHighlight('hi PmenuThumb ctermbg=8 ctermfg=8')
call SetHighlight('hi FoldColumn ctermbg=NONE ctermfg=7')
call SetHighlight('hi Folded ctermbg=NONE ctermfg=8')
call SetHighlight('hi WildMenu ctermbg=2 ctermfg=0')
call SetHighlight('hi SpecialKey ctermbg=NONE ctermfg=8')
call SetHighlight('hi DiffAdd ctermbg=NONE ctermfg=2')
call SetHighlight('hi DiffChange ctermbg=NONE ctermfg=8')
call SetHighlight('hi DiffDelete ctermbg=NONE ctermfg=1')
call SetHighlight('hi DiffText ctermbg=NONE ctermfg=4')
call SetHighlight('hi IncSearch ctermbg=NONE ctermfg=1 cterm=reverse term=reverse')
call SetHighlight('hi Search ctermbg=3 ctermfg=0')
call SetHighlight('hi Directory ctermbg=NONE ctermfg=4')
call SetHighlight('hi MatchParen ctermbg=NONE ctermfg=none cterm=italic,underline')
call SetHighlight('hi signColumn ctermbg=NONE ctermfg=4')
call SetHighlight('hi SignColumn ctermbg=NONE ctermfg=4')
call SetHighlight('hi ErrorMsg ctermbg=NONE ctermfg=7')
call SetHighlight('hi ModeMsg ctermbg=NONE ctermfg=2')
call SetHighlight('hi MoreMsg ctermbg=NONE ctermfg=2')
call SetHighlight('hi Question ctermbg=NONE ctermfg=4')
call SetHighlight('hi WarningMsg ctermbg=1 ctermfg=0')
call SetHighlight('hi Cursor ctermbg=NONE ctermfg=8')
call SetHighlight('hi Structure ctermbg=NONE ctermfg=5')
call SetHighlight('hi CursorColumn ctermbg=8 ctermfg=7')
call SetHighlight('hi ModeMsg ctermbg=NONE ctermfg=7')
call SetHighlight('hi SpellBad ctermbg=NONE ctermfg=1 cterm=underline')
call SetHighlight('hi SpellCap ctermbg=NONE ctermfg=4 cterm=underline')
call SetHighlight('hi SpellLocal ctermbg=NONE ctermfg=5 cterm=underline')
call SetHighlight('hi SpellRare ctermbg=NONE ctermfg=6 cterm=underline')
call SetHighlight('hi Boolean ctermbg=NONE ctermfg=5')
call SetHighlight('hi Character ctermbg=NONE ctermfg=1')
call SetHighlight('hi Conditional ctermbg=NONE ctermfg=5')
call SetHighlight('hi Define ctermbg=NONE ctermfg=5')
call SetHighlight('hi Delimiter ctermbg=NONE ctermfg=5')
call SetHighlight('hi Float ctermbg=NONE ctermfg=5')
call SetHighlight('hi Include ctermbg=NONE ctermfg=4')
call SetHighlight('hi Keyword ctermbg=NONE ctermfg=5')
call SetHighlight('hi Label ctermbg=NONE ctermfg=3')
call SetHighlight('hi Operator ctermbg=NONE ctermfg=7')
call SetHighlight('hi Repeat ctermbg=NONE ctermfg=3')
call SetHighlight('hi SpecialChar ctermbg=NONE ctermfg=5')
call SetHighlight('hi Tag ctermbg=NONE ctermfg=3')
call SetHighlight('hi Typedef ctermbg=NONE ctermfg=3')
call SetHighlight('hi vimUserCommand ctermbg=NONE ctermfg=1 cterm=BOLD')
call SetHighlight('hi vimAugroup ctermbg=NONE')
	hi link vimMap vimUserCommand
	hi link vimLet vimUserCommand
	hi link vimCommand vimUserCommand
	hi link vimFTCmd vimUserCommand
	hi link vimAutoCmd vimUserCommand
	hi link vimNotFunc vimUserCommand
call SetHighlight('hi vimNotation ctermbg=NONE ctermfg=4')
call SetHighlight('hi vimMapModKey ctermbg=NONE ctermfg=4')
call SetHighlight('hi vimBracket ctermbg=NONE ctermfg=7')
call SetHighlight('hi vimCommentString ctermbg=NONE ctermfg=8')
call SetHighlight('hi htmlLink ctermbg=NONE ctermfg=1 cterm=underline')
call SetHighlight('hi htmlBold ctermbg=NONE ctermfg=3 cterm=BOLD')
call SetHighlight('hi htmlItalic ctermbg=NONE ctermfg=5')
call SetHighlight('hi htmlEndTag ctermbg=NONE ctermfg=7')
call SetHighlight('hi htmlTag ctermbg=NONE ctermfg=7')
call SetHighlight('hi htmlTagName ctermbg=NONE ctermfg=1 cterm=BOLD')
call SetHighlight('hi htmlH1 ctermbg=NONE ctermfg=7')
	hi link htmlH2 htmlH1
	hi link htmlH3 htmlH1
	hi link htmlH4 htmlH1
	hi link htmlH5 htmlH1
	hi link htmlH6 htmlH1
call SetHighlight('hi cssMultiColumnAttr ctermbg=NONE ctermfg=2')
	hi link cssFontAttr cssMultiColumnAttr
	hi link cssFlexibleBoxAttr cssMultiColumnAttr
call SetHighlight('hi cssBraces ctermbg=NONE ctermfg=7')
	hi link cssAttrComma cssBraces
call SetHighlight('hi cssValueLength ctermbg=NONE ctermfg=7')
call SetHighlight('hi cssUnitDecorators ctermbg=NONE ctermfg=7')
call SetHighlight('hi cssValueNumber ctermbg=NONE ctermfg=7')
	hi link cssValueLength cssValueNumber
call SetHighlight('hi cssNoise ctermbg=NONE ctermfg=8')
call SetHighlight('hi cssTagName ctermbg=NONE ctermfg=1')
call SetHighlight('hi cssFunctionName ctermbg=NONE ctermfg=4')
call SetHighlight('hi scssSelectorChar ctermbg=NONE ctermfg=7')
call SetHighlight('hi scssAttribute ctermbg=NONE ctermfg=7')
	hi link scssDefinition cssNoise
call SetHighlight('hi sassidChar ctermbg=NONE ctermfg=1')
call SetHighlight('hi sassClassChar ctermbg=NONE ctermfg=5')
call SetHighlight('hi sassInclude ctermbg=NONE ctermfg=5')
call SetHighlight('hi sassMixing ctermbg=NONE ctermfg=5')
call SetHighlight('hi sassMixinName ctermbg=NONE ctermfg=4')
call SetHighlight('hi javaScript ctermbg=NONE ctermfg=7')
call SetHighlight('hi javaScriptBraces ctermbg=NONE ctermfg=7')
call SetHighlight('hi javaScriptNumber ctermbg=NONE ctermfg=5')
call SetHighlight('hi markdownH1 ctermbg=NONE ctermfg=7')
	hi link markdownH2 markdownH1
	hi link markdownH3 markdownH1
	hi link markdownH4 markdownH1
	hi link markdownH5 markdownH1
	hi link markdownH6 markdownH1
call SetHighlight('hi markdownAutomaticLink ctermbg=NONE ctermfg=2 cterm=underline')
	hi link markdownUrl markdownAutomaticLink
call SetHighlight('hi markdownError ctermbg=NONE ctermfg=7')
call SetHighlight('hi markdownCode ctermbg=NONE ctermfg=3')
call SetHighlight('hi markdownCodeBlock ctermbg=NONE ctermfg=3')
call SetHighlight('hi markdownCodeDelimiter ctermbg=NONE ctermfg=5')
call SetHighlight('hi markdownItalic cterm=Italic')
call SetHighlight('hi markdownBold cterm=Bold')
call SetHighlight('hi xdefaultsValue ctermbg=NONE ctermfg=7')
call SetHighlight('hi rubyInclude ctermbg=NONE ctermfg=4')
call SetHighlight('hi rubyDefine ctermbg=NONE ctermfg=5')
call SetHighlight('hi rubyFunction ctermbg=NONE ctermfg=4')
call SetHighlight('hi rubyStringDelimiter ctermbg=NONE ctermfg=2')
call SetHighlight('hi rubyInteger ctermbg=NONE ctermfg=3')
call SetHighlight('hi rubyAttribute ctermbg=NONE ctermfg=4')
call SetHighlight('hi rubyConstant ctermbg=NONE ctermfg=3')
call SetHighlight('hi rubyInterpolation ctermbg=NONE ctermfg=2')
call SetHighlight('hi rubyInterpolationDelimiter ctermbg=NONE ctermfg=3')
call SetHighlight('hi rubyRegexp ctermbg=NONE ctermfg=6')
call SetHighlight('hi rubySymbol ctermbg=NONE ctermfg=2')
call SetHighlight('hi rubyTodo ctermbg=NONE ctermfg=8')
call SetHighlight('hi rubyRegexpAnchor ctermbg=NONE ctermfg=7')
	hi link rubyRegexpQuantifier rubyRegexpAnchor
call SetHighlight('hi pythonOperator ctermbg=NONE ctermfg=5')
call SetHighlight('hi pythonFunction ctermbg=NONE ctermfg=4')
call SetHighlight('hi pythonBuiltinFunc ctermbg=NONE ctermfg=4')
call SetHighlight('hi pythonNone ctermbg=NONE ctermfg=4')
call SetHighlight('hi pythonRepeat ctermbg=NONE ctermfg=5')
call SetHighlight('hi pythonStatement ctermbg=NONE ctermfg=1 cterm=Bold')
call SetHighlight('hi pythonBuiltIn ctermbg=NONE ctermfg=4')
call SetHighlight('hi phpMemberSelector ctermbg=NONE ctermfg=7')
call SetHighlight('hi phpComparison ctermbg=NONE ctermfg=7')
call SetHighlight('hi phpParent ctermbg=NONE ctermfg=7')
call SetHighlight('hi cOperator ctermbg=NONE ctermfg=6')
call SetHighlight('hi cPreCondit ctermbg=NONE ctermfg=5')
call SetHighlight('hi SignifySignAdd ctermbg=NONE ctermfg=2')
call SetHighlight('hi SignifySignChange ctermbg=NONE ctermfg=4')
call SetHighlight('hi SignifySignDelete ctermbg=NONE ctermfg=1')
call SetHighlight('hi NERDTreeDirSlash ctermbg=NONE ctermfg=4')
call SetHighlight('hi NERDTreeExecFile ctermbg=NONE ctermfg=7')
call SetHighlight('hi ALEErrorSign ctermbg=NONE ctermfg=1')
call SetHighlight('hi ALEWarningSign ctermbg=NONE ctermfg=3')
call SetHighlight('hi ALEError ctermbg=NONE ctermfg=1')
call SetHighlight('hi ALEWarning ctermbg=NONE ctermfg=3')

" }}}

" Plugin options {{{

let g:limelight_conceal_ctermfg = 8

" }}}

call SetHighlight('hi GitGutterAdd ctermbg=NONE')
call SetHighlight('hi GitGutterChange ctermbg=NONE')
call SetHighlight('hi GitGutterDelete ctermbg=NONE')
