require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

Dir['lib/fhir_models/tasks/**/*.rake'].each do |file|
  load file
end

desc 'Run basic tests'
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
  t.warning = false
end

RSpec::Core::RakeTask.new

desc 'Run rubocop'
task :rubocop do
  RuboCop::RakeTask.new
end

task test: [:rubocop] do
  system('open coverage/index.html')
end

task default: [:rspec, :test]
