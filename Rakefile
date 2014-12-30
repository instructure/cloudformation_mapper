require "bundler/gem_tasks"
require 'byebug'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
task :default => :spec

$LOAD_PATH.unshift File.expand_path('./lib')
load './lib/tasks/scrape_aws_cf_docs.rake'
