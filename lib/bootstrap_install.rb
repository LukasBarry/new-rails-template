def rename_stylesheet
  inside 'app/assets/stylesheets' do
    File.rename("application.css", "application.scss")
  end
end

def insert_import
  insert_into_file 'app/assets/stylesheets/application.scss', after: "*/\n" do <<-RUBY
@import "bootstrap-sprockets";
@import "bootstrap";
  RUBY
  end
end

def insert_required_js
  insert_into_file 'app/assets/javascripts/application.js', after: "//= require turbolinks\n" do <<-RUBY
//= require cable
//= require bootstrap-sprockets
  RUBY
  end
end

def remove_require_tree_and_self
  gsub_file 'app/assets/stylesheets/application.scss', '*= require_tree .', ''
  gsub_file 'app/assets/stylesheets/application.scss', '*= require_self', ''
  gsub_file 'app/assets/javascripts/application.js', '//= require_tree .', ''
end
