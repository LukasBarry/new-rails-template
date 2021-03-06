def application_slim
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
end
