# frozen_string_literal: true

unless Rails.env.production?
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new

  namespace :ci do
    desc 'Run all tests'
    task tests: %i[spec rubocop]
  end
end
