
" Enable editing of gzipped files
"    read: set binary mode before reading the file
"          uncompress text in buffer after reading
"   write: compress file after writing
"  append: uncompress file, append, compress file
autocmd BufReadPre,FileReadPre      *.gz set bin
autocmd BufReadPost,FileReadPost    *.gz '[,']!gunzip
autocmd BufReadPost,FileReadPost    *.gz set nobin

autocmd BufWritePost,FileWritePost  *.gz !mv <afile> <afile>r
autocmd BufWritePost,FileWritePost  *.gz !gzip <afile>r

autocmd FileAppendPre           *.gz !gunzip <afile>
autocmd FileAppendPre           *.gz !mv <afile>r <afile>
autocmd FileAppendPost          *.gz !mv <afile> <afile>r
autocmd FileAppendPost          *.gz !gzip <afile>r


autocmd BufReadPost,FileReadPost,FilterReadPost	*.thtml,*.ctp	set syntax=thtml tw=0
autocmd BufReadPost,FileReadPost,FilterReadPost	*.c,*.cpp,*.cc,*.h,*.hpp,*.php,*.tpl	set tw=0
autocmd BufReadPost,FileReadPost,FilterReadPost	/tmp/mutt*	set nocindent tw=72

autocmd BufReadPre,FileReadPre      *.htm,*.html,*.css exe 'setlocal equalprg=E:/cygwin/bin/tidy\ -quiet\ --wrap\ 160\ --indent\ auto\ --indent-spaces\ 2\ --break-before-br\ yes\ -utf8\ --tidy-mark\ no\ --ascii-chars\ yes\ --uppercase-tags\ yes\ -f\ '.&errorfile
autocmd BufReadPre,FileReadPre      *.htm,*.html,*.css setlocal makeprg=E:/cygwin/bin/tidy\ -quiet\ --wrap\ 160\ --indent\ auto\ --indent-spaces\ 2\ --break-before-br\ yes\ -utf8\ --tidy-mark\ no\ --ascii-chars\ yes\ --uppercase-tags\ yes\ -e\ % 


set tags=./tags,tags,/usr/src/linux/tags
set winheight=15
set foldmethod=marker
let g:xml_syntax_folding=1
autocmd FileType xml setlocal foldmethod=syntax
"set tw=72

map gF ]]V?(<CR>y{pi/** {{{ <ESC>/{<CR>dd/^{<CR>?(<CR>O0<C-D> */<ESC>][o/* }}} */<ESC>+

map <C-Enter> <C-w><C-]><C-w>T
map <C-T>	:bro tabnew .<CR>
map <C-N>	:tabnext<CR>
map <C-P>	:tabprev<CR>
map <F1>	[[zz
map <F2>	]]zz
map <F3> '<O0<C-D>/ *hx'>o0<C-D>*/'<
map <F4> :NERDTreeToggle<CR>
map <F11> '<O#ifdef ANTIQUE<ESC>'>o#else<CR>#endif<ESC>'<b

map g/ :s/^/\/\//<CR>
map g\ :s/^\(\s*\)\/\//\1/<CR>

map g> :s/^\([^>]\)/> \1/<CR>
map g< :s/^> *//<CR>

map gg	G
map qq	:e #<CR>

map <C-K> :cn

map <ESC>OM <CR>

"map 	p :cp<CR>
"map 	n :cn<CR>
"map 		 :cf errlist<CR>

map Îw 1G
map Îu G$
map Î„ H
map Îv L$
imap Îw 1G
imap Îu G$
imap Î„ H
imap Îv L$
map  :cn

map [6~ 
map [5~ 
map [2~ i
imap [2~ 

set autoindent wrapmargin=0 shiftwidth=4 tabstop=4 showmatch sidescroll=1
set exrc ruler showmode edcompatible
set ignorecase
set nolisp
set cindent
set cpoptions=ces$
set nowrap
"set iskeyword=a-z,A-Z,0-9,_,.,-,>
set viminfo='50,:100,/100,\"1000
"set path=.,inc,../inc,/usr/include,/usr/X11R6/include,C:/Qt/2010.02.1/qt/include/ 
set path=.,inc,../inc,/usr/include,Include,Includes,../include,../includes

set errorfile=errlist
"set errorformat=%f(%l):\ Error!\ %t%n:%m,file\ %*[^(](%f):%m
set errorformat=%f:%l:\ %m,In\ file\ included\ from\ %f:%l:,\^I\^Ifrom\ %f:%l%m
set makeprg=make\ -k
set shellpipe=|&\ tee
set grepprg=grep


" the following fix works also
"map  <BS>
"imap  <BS>
set t_kb=
set t_kD=

imap <S-Right> W
imap <S-Left> B
imap Îv L$
imap Î„ H
imap Îu G$
imap Îw 1G
map <S-Right> W
map <S-Left> B
map Îv L$
map Î„ H
map Îu G$
map Îw 1G

if has("gui")
	set guifont=Lucida\ Console
	set guioptions=afgmrbtT
endif

" Switch on syntax highlighting.
syntax on

" Switch on search pattern highlighting.
set hlsearch

" Hide the mouse pointer while typing
set mousehide

" Set nice colors
" background for normal text is light grey
" Text below the last line is darker grey
" Cursor is green
" Constants are not underlined but have a slightly lighter background
highlight Normal guibg=white
"highlight Cursor guibg=Green guifg=NONE
"highlight Cursor gui=reverse guibg=Blue 
highlight Cursor gui=reverse guibg=Yellow guifg=NONE
highlight NonText guibg=grey80
highlight Constant gui=NONE guibg=grey95
highlight Special gui=NONE guibg=grey95
highlight Search guibg=grey92

"menu Comment./*\ */ '<O0<C-D>/*'>o0<C-D>*/'<
"menu Comment.Antique '<O#ifdef ANTIQUE<ESC>'>o#else<CR>#endif<ESC>'<b

set printoptions=paper:a4

filetype plugin on

  " Only do this when not done yet for this buffer
  if exists("b:did_ftplugin")
    finish
  endif
  " Don't set 'b:did_ftplugin = 1' because that is xml.vim's responsability.

  let b:html_mode = 1

  if !exists("*HtmlAttribCallback")
  function HtmlAttribCallback( xml_tag )
      if a:xml_tag ==? "table"
          return "cellpadding=\"0\" cellspacing=\"0\" border=\"0\""
      elseif a:xml_tag ==? "link"
          return "href=\"/site.css\" rel=\"StyleSheet\" type=\"text/css\""
      elseif a:xml_tag ==? "body"
          return "bgcolor=\"white\""
      elseif a:xml_tag ==? "frame"
          return "name=\"NAME\" src=\"/\" scrolling=\"auto\" noresize"
      elseif a:xml_tag ==? "frameset"
          return "rows=\"0,*\" cols=\"*,0\" border=\"0\""
      elseif a:xml_tag ==? "img"
          return "src=\"\" width=\"0\" height=\"0\" border=\"0\" alt=\"\""
      elseif a:xml_tag ==? "a"
          if has("browse")
              " Look up a file to fill the href. Used in local relative file
              " links. typeing your own href before closing the tag with `>'
              " will override this.
              let cwd = getcwd()
              let cwd = substitute (cwd, "\\", "/", "g")
              let href = browse (0, "Link to href...", getcwd(), "")
              let href = substitute (href, cwd . "/", "", "")
              let href = substitute (href, " ", "%20", "g")
          else
              let href = ""
          endif
          return "href=\"" . href . "\""
      else
          return 0
      endif
  endfunction
  endif


  imap <C-J> <Plug>MarkersJumpF
  map <C-J> <Plug>MarkersJumpF
  imap <C-K> <Plug>MarkersJumpB
  map <C-K> <Plug>MarkersJumpB
  imap <C-<> <Plug>MarkersMark
  vmap <C-<> <Plug>MarkersMark

"  ruby require "base64"
"  map <C-F3> :rubydo $_=Base64.decode64 $_<CR>
"  imap <C-F3> :rubydo $_=Base64.decode64 $_<CR>
"  map <C-F4> :rubydo $_=Base64.encode64 $_<CR>
"  imap <C-F4> :rubydo $_=Base64.encode64 $_<CR>


"  unmap! pp
"  unmap! ps
"  unmap! pg
"  unmap! pc
"  unmap! xx
"  unmap! xs
"  unmap! xg

"let g:netrw_ssh_cmd="ssh -p 221"


" To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1

" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 1



if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif


