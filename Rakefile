# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'rubocop/rake_task'

require File.expand_path('config/application', __dir__)

Rails.application.load_tasks

namespace :pre_commit do
  task ci: [:spec]
end

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--display-cop-names']
end

task 'db:schema:load' do
  Rake::Task['db:structure:load'].invoke
end
