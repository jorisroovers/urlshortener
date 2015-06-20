require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['urlshortener/tests/test*.rb']
  t.verbose = true
end

task :default => :test