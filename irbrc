#!/usr/bin/ruby

require 'rubygems' unless defined? Gem
# IrbTools : https://github.com/janlelis/irbtools
require 'irbtools'

require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

