gemspecinstall() {
  gem install bundler
  # Create a Gemfile to build the gem from the gemspec.
  printf "source :rubygems\ngemspec :path => '.'\n" > Gemfile
  # Install Z gem!
  bundle install
}
