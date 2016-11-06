def readme_override
  remove_file 'README.md'
  template 'lib/README.md', 'README.md'
end
