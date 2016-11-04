# # Template for new Rails projects
# # new_rails_template.rb
def render_file(path)
  file = IO.read(path)
end

file "Gemfile", render_file(File.join(File.expand_path(File.dirname(__FILE__)), 'Gemfile'))

inside 'config' do
  remove_file 'database.yml'
  create_file 'database.yml' do <<-EOF
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: #{app_name}_development

  test:
    <<: *default
    database: #{app_name}_test
EOF
  end
end

remove_dir 'test'

gsub_file 'config/application.rb', "require 'rails/all'", "require 'rails'\n# Pick the frameworks you want:\nrequire 'active_model/railtie'\nrequire 'active_job/railtie'\nrequire 'active_record/railtie'\nrequire 'action_controller/railtie'\nrequire 'action_mailer/railtie'\nrequire 'action_view/railtie'\nrequire 'action_cable/engine'\nrequire 'sprockets/railtie'\n#require 'rails/test_unit/railtie'"

inside 'app/assets/stylesheets' do
  File.rename("application.css", "application.scss")
end

  insert_into_file 'app/assets/stylesheets/application.scss', after: "*/\n" do <<-RUBY
@import "bootstrap-sprockets";
@import "bootstrap";
  RUBY
  end

  insert_into_file 'app/assets/javascripts/application.js', after: "//= require turbolinks\n" do <<-RUBY
//= require cable
//= require bootstrap-sprockets
  RUBY
  end

gsub_file 'app/assets/stylesheets/application.scss', '*= require_tree .', ''
gsub_file 'app/assets/stylesheets/application.scss', '*= require_self', ''
gsub_file 'app/assets/javascripts/application.js', '//= require_tree .', ''

after_bundle do
  generate 'simple_form:install'
  generate 'rspec:install'
  generate 'annotate:install'

  inside 'lib/tasks' do
    remove_file 'auto_annotate_models.rake'
    create_file 'auto_annotate_models.rake' do <<-EOF
if Rails.env.development?
  task :set_annotation_options do
    Annotate.set_defaults(
      'position_in_class'       => 'after',
      'show_indexes'            => 'false',
      'exclude_tests'           => 'true',
      'exclude_fixtures'        => 'true',
      'exclude_factories'       => 'true',
      'exclude_serializers'     => 'true',
      'format_bare'             => 'false',
      'format_markdown'         => 'true',
      'sort'                    => 'true',
    )
  end

  Annotate.load_tasks
end
  EOF
    end
  end

  run 'annotate --exclude fixtures'

  inside 'app/views/layouts' do
    remove_file 'application.html.erb'
    create_file 'application.html.slim' do <<-EOF
doctype html

html lang=I18n.locale

  head
    title = content_for?(:title) ? yield(:title) : "Default Title"
    == yield :seo
    meta charset="utf-8"
    meta name="viewport" content="width=device-width, initial-scale=1.0"

    = csrf_meta_tags
    = stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track' => true
    = javascript_include_tag 'application', 'data-turbolinks-track' => true
    /![if lt IE 9]
      script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"
  body
    == yield
  EOF
    end
  end

  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end
