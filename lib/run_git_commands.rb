def git_commands
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end
