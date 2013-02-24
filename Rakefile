require "bundler/gem_tasks"
require 'rake'
require 'rspec/core/rake_task'

desc "Default runs the rspec tests"
task :default => :spec


desc "Rspec test"
RSpec::Core::RakeTask.new :spec

desc "Easter"
task :hello do
  puts `fortune -a`
end