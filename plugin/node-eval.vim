" node-eval.vim - Simple node -pe thing for vim
" Maintainer:   mklabs

if exists("g:loaded_node_eval") || v:version < 700 || &cp
  " finish
endif
let g:loaded_node_eval = 1

function! s:nodeEval() range
  let lines = join(getline(a:firstline, a:lastline), "\n")

  " Clam exists? use it instead of a dumb echo
  if exists(':Clam')
    exe 'Clam node -pe "' . lines . '"'
    return
  endif

  let result = system('node -pe "' . lines . '"')
  echo result
endfunction

autocmd! Filetype coffee     command! -nargs=* -range NodeEval <line1>,<line2>call s:nodeEval()
autocmd! Filetype javascript command! -nargs=* -range NodeEval <line1>,<line2>call s:nodeEval()
autocmd! Filetype markdown   command! -nargs=* -range NodeEval <line1>,<line2>call s:nodeEval()




" vim:set sw=2 sts=2:
