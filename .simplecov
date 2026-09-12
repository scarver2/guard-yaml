# .simplecov
# frozen_string_literal: true

SimpleCov.configure do
  # Bundler evaluates the gemspec, which loads the version file before SimpleCov starts.
  add_filter "/lib/guard/yaml/version.rb"
  add_filter "/spec/"
  enable_coverage :branch
  minimum_coverage 90
end
