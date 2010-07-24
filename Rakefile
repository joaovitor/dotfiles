namespace :dotfiles do
  desc "install it linking all the files"
  task :install do
    home_dir = ENV['HOME']
    dotfiles_dir = File.expand_path(File.dirname(__FILE__))
    options = {:noop => false, :verbose => true}
    %W(bash_profile gemrc gitignore ackrc irbrc).each do |file|
      original_path = File.join(dotfiles_dir, file)
      link_path = File.join(home_dir, ".#{file}")
      unless(File.exists?(link_path))
        FileUtils.ln_s(original_path, link_path, options)
      else
        puts "#{link_path} \t already exists on your system"
      end
    end
  end
end