# # Template for new Rails projects
# # new_rails_template.rb
require_relative 'lib/gemfile_config'
require_relative 'lib/database_config'
require_relative 'lib/remove_minitest'
require_relative 'lib/bootstrap_install'
require_relative 'lib/run_generate'
require_relative 'lib/annotate_defaults'
require_relative 'lib/insert_application_slim'
require_relative 'lib/run_git_commands'
require_relative 'lib/insert_code_climate'

def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

#removes and replaces the Gemfile
gemfile_override

#removes sqlite3 database.yml file and replaces it for postgresql
database_configuration

#removes minitest folder and puts correct requirements in application.rb for
#rspec to work
minitest_removal

#adds Bootstrap requirements for Bootstrap gem to work
rename_stylesheet
insert_import
insert_required_js
remove_require_tree_and_self

#all required after bundle install has been done
after_bundle do
  #installation for all gems that require it
  generate_all_gems

  #adds codeclimate requirements to spec_helper.rb
  code_climate

  #replaces the annotate file with my preferred defaults
  set_annotate_defaults

  #replaces the application.html.erb with application.html.slim
  application_slim

  #runs initial git commands
  git_commands

  puts "\nYour new Rails App has been successfully created"
end
