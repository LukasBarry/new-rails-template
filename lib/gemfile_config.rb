def gemfile_override
  remove_file 'Gemfile'
  template 'lib/Gemfile', 'Gemfile'
end
