def code_climate
  insert_into_file 'spec/spec_helper.rb', before: "# This file was" do <<-RUBY
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require "pundit/rspec"
  RUBY
  end
end
