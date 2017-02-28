" let g:neomake_typescript_tsc_maker = {
"     \ 'args': [ '-m', 'commonjs', '--noEmit' ],
"     \ 'append_file': 0,
"     \ 'errorformat':
"             \ '%E%f %#(%l\,%c): error %m,' .
"             \ '%E%f %#(%l\,%c): %m,' .
"             \ '%Eerror %m,' .
"             \ '%C%\s%\+%m'
" \ }

" convert to object literal function syntax
let @f = "^f:dt("

" convert object literal anonymous function into class method syntax
let @c = "^f:dt(f{%f,x"

let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
"autocmd FileType typescript nmap <buffer> <LocalLeader> rn <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <LocalLeader>rn :TsuRenameSymbol<CR>
autocmd FileType typescript nmap <buffer> <LocalLeader>fr :TsuReferences<CR>
autocmd FileType typescript nmap <buffer> <LocalLeader>i :TsuImport<CR>
autocmd FileType typescript nmap <buffer> <LocalLeader>b :echo tsuquyomi#hint()<CR>

" let g:tss_auto_open_loclist=1
" nmap <buffer> <leader>h :TssQuickInfo<cr>
" nmap <buffer> <leader>d :TssDefinition<cr>
" nmap <buffer> <leader>q :TssQuickInfo<cr>
" nmap <buffer> <leader>u :TssReferences<cr>
" nmap <buffer> <leader>e :TssErrors<cr>
" nmap <buffer> <leader>m :TssRename "pc"<cr>
