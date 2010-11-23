require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name        = "subset_validator"
  gem.homepage    = "http://github.com/nickhoffman/subset_validator"
  gem.license     = "MIT"
  gem.summary     = %Q{An ActiveModel validation for checking if an attribute's values are a subset of another set.}
  gem.description = %Q{An ActiveModel validation for checking if an attribute's values are a subset of another set.}
  gem.email       = "nick@deadorange.com"
  gem.authors     = ["Nick Hoffman"]

  gem.add_dependency  'active_model', '~> 3.0.3'

  gem.add_development_dependency "rspec",    "~> 2.1.0"
  gem.add_development_dependency "bundler",  "~> 1.0.0"
  gem.add_development_dependency "jeweler",  "~> 1.5.1"
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "subset_validator #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
