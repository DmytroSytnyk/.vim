set nocompatible
filetype off                   " required
"Initialize vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'OmniCppComplete'

Bundle 'Rip-Rip/clang_complete'
"Bundle 'justmao945/vim-clang'
Bundle 'rhysd/vim-clang-format'
Bundle 'MarcWeber/vim-addon-manager' 

filetype plugin indent on     " required!"

"Initialize Pathogen plugin
"execute pathogen#infect()
"Call activateaddons from VAM
let opts = {'auto_install' : 1 }
"call vam#ActivateAddons(["lh-refactor","lh-dev"], opts)
call vam#ActivateAddons(["lh-cpp","lh-refactor","lh-dev"], opts)
source ~/.vim/.pento_vimrc
"set runtimepath+=${test_dir}/vim-addon-manager

"Marker keybindings
imap <C-K>      <Plug>MarkersJumpB
map <C-K>      <Plug>MarkersJumpB
call SMap ("C-k","<Plug>MarkersJumpF")

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
"nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>"imap <C-j>      <Plug>MarkersJumpF

""Adding clang checker on F5
"function! ClangCheckImpl(cmd)
"  if &autowrite | wall | endif
"  echo "Running " . a:cmd . " ..."
"  let l:output = system(a:cmd)
"  cexpr l:output
"  cwindow
"  let w:quickfix_title = a:cmd
"  if v:shell_error != 0
"    cc
"  endif
"  let g:clang_check_last_cmd = a:cmd
"endfunction

"function! ClangCheck()
"  let l:filename = expand('%')
"  if l:filename =~ '\.\(cpp\|cxx\|cc\|c\)$'
"    call ClangCheckImpl("clang-check " . l:filename)
"  elseif exists("g:clang_check_last_cmd")
"    call ClangCheckImpl(g:clang_check_last_cmd)
"  else
"    echo "Can't detect file's compilation arguments and no previous clang-check invocation!"
"  endif
"endfunction

"nmap <silent> <C-F5> :call ClangCheck()<CR><CR>


"Auto open all folds on file load 
" Note, perl automatically sets foldmethod in the syntax file
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR
