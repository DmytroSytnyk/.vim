set nocompatible
filetype off                   " required
"Initialize vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'OmniCppComplete'

"Bundle 'Rip-Rip/clang_complete'
"Bundle 'justmao945/vim-clang'
Bundle 'rhysd/vim-clang-format'
Bundle 'MarcWeber/vim-addon-manager' 
Bundle 'scrooloose/syntastic' 
"Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex' 

filetype plugin indent on     " required!"

"Initialize Pathogen plugin
"execute pathogen#infect()
"Call activateaddons from VAM
let opts = {'auto_install' : 1 }
"call vam#ActivateAddons(["lh-refactor","lh-dev"], opts)
call vam#ActivateAddons(["lh-cpp","lh-refactor","lh-dev"], opts)

source ~/.vim/.pento_vimrc

"Syntastic options 
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall'
let g:syntastic_cpp_checkers=['clang', 'cppcheck']
"set runtimepath+=${test_dir}/vim-addon-manager

"Marker keybindings
imap <C-K>      <Plug>MarkersJumpB
map <C-K>      <Plug>MarkersJumpB
imap <C-J>      <Plug>MarkersJumpF
map <C-J>      <Plug>MarkersJumpF
"call SMap ("C-k","<Plug>MarkersJumpB")
"call SMap ("C-j","<Plug>MarkersJumpF")

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

"Auto open all folds on file load 
" Note, perl automatically sets foldmethod in the syntax file
"autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR
