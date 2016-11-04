def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

def gemfile_override
  remove_file 'Gemfile'
  template 'lib/Gemfile', 'Gemfile'
end
