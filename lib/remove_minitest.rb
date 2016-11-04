def minitest_removal
  remove_dir 'test'
  gsub_file 'config/application.rb', "require 'rails/all'", "require 'rails'\n# Pick the frameworks you want:\nrequire 'active_model/railtie'\nrequire 'active_job/railtie'\nrequire 'active_record/railtie'\nrequire 'action_controller/railtie'\nrequire 'action_mailer/railtie'\nrequire 'action_view/railtie'\nrequire 'action_cable/engine'\nrequire 'sprockets/railtie'\n#require 'rails/test_unit/railtie'"
end
