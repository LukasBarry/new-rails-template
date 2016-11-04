def database_configuration
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
end
