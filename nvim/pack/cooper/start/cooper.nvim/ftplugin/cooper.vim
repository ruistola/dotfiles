" Cooper filetype settings: comments only. Indentation follows your own defaults.
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal commentstring=#\ %s
setlocal comments=:#

let b:undo_ftplugin = "setlocal commentstring< comments<"
