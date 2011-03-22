rvmrcit() {
  # Create a gemset for the current directory (gem) name 
  # under the currently selected (RVM) Ruby, optional.
  rvm --create use "${rvm_ruby_string}@$(basename $(pwd))"
}
