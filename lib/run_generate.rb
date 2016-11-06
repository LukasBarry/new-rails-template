def generate_all_gems
  generate 'simple_form:install'
  generate 'rspec:install'
  generate 'annotate:install'
  generate 'pundit:install'
  generate 'devise:install'
  generate 'devise:views'
  generate 'devise User name:string address:string admin:boolean'
  generate 'active_admin:install User'
end
