if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " log files such as catalina.out or log4j files.
  au! BufRead,BufNewFile catalina.out,*.out,*.out.*,*.log,*.log.* setf log
augroup END
