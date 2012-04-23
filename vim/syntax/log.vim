" Vim syntax file
" file type: log files
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn match logError ".* FATAL .*"
syn match logError "^FATAL: .*"
syn match logError ".* ERROR .*"
syn match logError "^ERROR: .*"
syn match logWarn ".* WARN .*"
syn match logWarn "^WARN: .*"
syn match logInfo ".* INFO .*"
syn match logInfo "^INFO: .*"
"syn match logDebug ".* DEBUG .*"
"syn match logDebug "^DEBUG: .*"

syn match logError "^java.*Exception.*"
syn match logError "^java.*Error.*"


hi logError ctermfg=Red guifg=Red
hi logWarn ctermfg=Yellow guifg=Yellow
hi logInfo ctermfg=Green guifg=Green
"hi logDebug ctermfg=Gray guifg=Gray

let b:current_syntax = "log"

