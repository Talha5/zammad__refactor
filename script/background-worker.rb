#!/usr/bin/env ruby


begin
  load File.expand_path('../bin/spring', __dir__)
rescue LoadError => e
  raise if e.message.exclude?('spring')
end

dir = File.expand_path(File.join(File.dirname(__FILE__), '..'))
Dir.chdir dir

require 'bundler'
require File.join(dir, 'config', 'environment')

BackgroundServices::Cli.start(ARGV)
