# irbrc merged
# http://eustaquiorangel.com/posts/552
# http://gist.github.com/86875

require "irb/completion"         # activate default completion
require 'irb/ext/save-history'   # activate default history 
require "tempfile"               # used for Vim integration
require 'pp'

# save history using built-in options
IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# auto-indent
IRB.conf[:AUTO_INDENT]=true

# try to load rubygems
begin
   require "rubygems"
rescue LoadError => e
   puts "Seems you don't have Rubygems installed: #{e}"
end

# let there be colors
# just use Wirble for colors, since some enviroments dont have
# rubygems and wirble installed
begin
   require "wirble"
   Wirble.init(:skip_prompt=>true,:skip_history=>true)
   Wirble.colorize
rescue LoadError => e
   puts "Seems you don't have Wirble installed: #{e}"
end

# enabling Hirb
begin
  require 'hirb'
  Hirb.enable
rescue LoadError => e
  puts "Seems you don't have Hirb installed: #{e}"
end

# configure vim
@irb_temp_code = nil

def vim(file=nil)
   file = file || @irb_temp_code || Tempfile.new("irb_tempfile").path+".rb"
   system("vim #{file}")
   if(File.exists?(file) && File.size(file)>0)
      Object.class_eval(File.read(file))
      @irb_temp_code = file
   else
      "No file loaded."
   end
rescue => e
   puts "Error on vim: #{e}"
end

class Object
  # get all the methods for an object that aren't basic methods from Object
  def my_methods
    (methods - Object.instance_methods).sort
  end
end

# from http://themomorohoax.com/2009/03/27/irb-tip-load-files-faster
def ls
   %x{ls}.split("\n")
end

def cd(dir)
  Dir.chdir(dir)
  Dir.pwd
end

def pwd
  Dir.pwd
end

# also from http://themomorohoax.com/2009/03/27/irb-tip-load-files-faster
def rl(file_name = nil)
  if file_name.nil?
    if !@recent.nil?
      rl(@recent) 
    else
      puts "No recent file to reload"
    end
  else
    file_name += '.rb' unless file_name =~ /\.rb/
    @recent = file_name 
    load "#{file_name}"
  end
end

alias p pp
alias quit exit

