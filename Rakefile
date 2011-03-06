require 'rubygems'
require 'rake'
require 'rake/gempackagetask'
require 'rspec/core/rake_task'
require 'bundler'

Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new :spec do |t|
  t.rspec_opts= '--color'
end

task :default => :spec
