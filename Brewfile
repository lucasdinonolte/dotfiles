tap "thoughtbot/formulae"
tap "homebrew/services"
tap "universal-ctags/universal-ctags"

# Unix
brew "universal-ctags", args: ["HEAD"]
brew "git"
brew "openssl"
brew "rcm"
brew "reattach-to-user-namespace"
brew "the_silver_searcher"
brew "tmux"
brew "vim"
brew "watchman"
brew "zsh"

# Heroku
brew "heroku"
brew "parity"

# GitHub
brew "hub"

# Image manipulation
brew "imagemagick"

# Testing
brew "qt@5.5" if MacOS::Xcode.installed?

# Programming languages and package managers
brew "libyaml" # should come after openssl
brew "node"
brew "rbenv"
brew "ruby-build"
brew "yarn"

# Databases
brew "postgres", restart_service: :changed
brew "redis", restart_service: :changed
