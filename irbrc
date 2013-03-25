# ruby 1.8.7 compatible
require 'rubygems'
require 'irb/completion'

# configure irb
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000

# IrbTools: package of many useful gems
# See: https://github.com/janlelis/irbtools
require 'irbtools'
