require "rubygems"
require "bundler"
require "rake"
require "rspec/core/rake_task"

Bundler::GemHelper.install_tasks

desc "Default: run specs and features"
task :default do
  system("bundle exec rake -s features")
end

namespace :spec do
  desc "Run specs"
  RSpec::Core::RakeTask.new("unit") do |t|
    t.pattern = "spec/{*_spec.rb, profanity_filter/**/*_spec.rb}"
  end
end
