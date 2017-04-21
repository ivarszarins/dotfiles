syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" If you are using the omnisharp-roslyn backend, use the following
" let g:syntastic_cs_checkers = ['code_checker']

augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    "autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>

    " Builds can also run asynchronously with vim-dispatch installed
    " autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    "
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <LocalLeader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <LocalLeader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <LocalLeader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <LocalLeader>fr :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <LocalLeader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <LocalLeader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <LocalLeader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <LocalLeader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <LocalLeader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <LocalLeader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <LocalLeader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <LocalLeader>rn :OmniSharpRename<cr>

" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <LocalLeader>rl :OmniSharpReloadSolution<cr>
nnoremap <LocalLeader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <LocalLeader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <LocalLeader>ss :OmniSharpStartServer<cr>
nnoremap <LocalLeader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <LocalLeader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

" Enable snippet completion, requires completeopt-=preview
let g:OmniSharp_want_snippet=1

