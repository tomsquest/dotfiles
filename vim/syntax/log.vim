" Vim syntax file
" file type: log files
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn match fatal ".* FATAL .*"
syn match fatal "^FATAL: .*"
syn match error ".* ERROR .*"
syn match error "^ERROR: .*"
syn match warn ".* WARN .*"
syn match warn "^WARN: .*"
syn match info ".* INFO .*"
syn match info "^INFO: .*"
syn match debug ".* DEBUG .*"
syn match debug "^DEBUG: .*"

syn match error "^java.*Exception.*"
syn match error "^java.*Error.*"

" Highlight colors for log levels.
hi fatal ctermfg=Red guifg=Red
hi error ctermfg=Red guifg=Red
hi warn ctermfg=Yellow guifg=Yellow
hi info ctermfg=Green guifg=Green
hi debug ctermfg=Gray guifg=Gray

let b:current_syntax = "log"

