# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

FirstApp::Application.load_tasks

Rake::Task[:spec].clear

if Rails.env.test? || Rails.env.development?
  Rspec::Core::RakeTask.new(:spec) do |t|
     t.verbose = false
     t.rspec_opts = "--color"
  end
end
