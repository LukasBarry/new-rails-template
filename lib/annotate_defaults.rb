def set_annotate_defaults
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
end
