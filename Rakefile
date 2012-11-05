#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'lib/navfund'
  t.test_files = FileList['test/lib/navfund/*_test.rb']
  t.verbose = true
end
task :default => :test
