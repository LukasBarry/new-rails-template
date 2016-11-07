def code_climate
  insert_into_file 'spec/spec_helper.rb', before: "# This file was" do <<-RUBY
require "simplecov"
SimpleCov.start
require "pundit/rspec"
  RUBY
  end
end

def travis_setup
  create_file '.travis.yml', <<-EOF
language: ruby
rvm:
  - 2.2.5
addons:
  postgresql: '9.4'
  code_climate:
    repo_token: [insert token here]
script:
  - RAILS_ENV=test bundle exec rspec spec
before_script:
  - cp config/database.travis.yml config/database.yml
  - psql -c 'create database #{app_name}' -U postgres
  - RAILS_ENV=test bundle exec rake db:migrate --trace
EOF
  create_file 'config/database.travis.yml', <<-EOF
test:
  adapter: postgresql
  encoding: unicode
  database: #{app_name}
  username: postgres
  pool: 5
EOF
end
