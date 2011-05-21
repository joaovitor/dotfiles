namespace :dotfiles do
  desc "install it linking all the files"
  task :install do
    home_dir = ENV['HOME']
    options = {:noop => false, :verbose => true, :force => true}
    Dir.glob("dotfiles/**").each do |file_path|
      file = File.basename(file_path)
      original_path = File.expand_path(file_path)
      link_path = File.join(home_dir, ".#{file}")
      FileUtils.ln_s(original_path, link_path, options)
    end
  end
end