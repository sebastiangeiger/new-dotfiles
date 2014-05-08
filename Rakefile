require File.expand_path('helper/package_list', File.dirname(__FILE__))
require 'rake'
require 'erb'

task :default => :install

desc "install the dot files into user's home directory"
task :install => [:symlink_dotfiles, :install_packages, :install_vundle, :change_default_shell]
task :install_packages do
  if `uname` =~ /Darwin/
    Rake::Task["install_homebrew"].invoke
  elsif `uname` =~ /Linux/
    Rake::Task["install_with_apt_get"].invoke
  end
end

task :rvm do
  system "curl -L get.rvm.io | bash -s stable"
end

task :compile_you_complete_me => [:install_vundle, :install_homebrew] do
  system 'cd ~/.vim/bundle/YouCompleteMe; ./install.sh --clang-completer'
end

task :install_vundle do
  if File.exists?(File.join(ENV['HOME'], ".vim", "bundle", "vundle"))
    puts "Vundle is already installed"
  else
    puts "Installing Vundle"
    system "mkdir -p ~/.vim/bundle"
    system "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
  end
  puts "Executing BundleInstall"
  system "vim +BundleInstall +qall"
end

task :change_default_shell => [:install_packages] do
  if `env | grep SHELL` =~ /fish$/
    puts "Default shell is fish"
  elsif executable_exists?("fish")
    puts "Setting fish as default shell"
    system "chsh -s $(which fish)"
    puts "Logout and login again so can enjoy your shiny new fish!"
  else
    $stderr.puts "Please install fish, then run 'rake change_default_shell'"
  end
end

task :install_homebrew do
  if executable_exists?("brew")
    puts "homebrew is already installed"
  else
    puts "installing homebrew"
    system %Q{/usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"}
  end
  installed_homebrews = `brew list`.split("\n")
  (PackageList.from_file("Packagefile").list_for(:mac) - installed_homebrews).each do |application|
    system "brew install #{application}"
  end
end

task :install_with_apt_get do
  list = PackageList.from_file("Packagefile").list_for(:linux)
  system "sudo apt-get -y install #{list.join(" ")}"
end

task :symlink_dotfiles do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.md LICENSE TODO.tasks Packagefile helper].include? file
    if File.directory?(file)
      replace_all = symlink_dir(file,replace_all)
    end

    if File.file?(file)
      replace_all = symlink_file(file,replace_all)
    end
  end
end

def symlink_dir(dir,replace_all)
  link_target = File.join(ENV['HOME'], ".#{dir}")
  if File.identical?(link_target,File.expand_path(dir))
    puts "~/.#{dir} already linked"
  elsif File.exists?(link_target)
    if replace_all
      replace_file(dir)
    else
      print "overwrite ~/.#{dir}? [ynaq] "
      case $stdin.gets.chomp
      when 'a'
        replace_all = true
        replace_file(dir)
      when 'y'
        replace_file(dir)
      when 'q'
        exit
      else
        puts "skipping ~/.#{dir}"
      end
    end
  else
    link_file(dir)
  end
  replace_all
end

def symlink_file(file,replace_all)
  if File.file?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
    if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
      puts "identical ~/.#{file.sub('.erb', '')}"
    elsif replace_all
      replace_file(file)
    else
      print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
      case $stdin.gets.chomp
      when 'a'
        replace_all = true
        replace_file(file)
      when 'y'
        replace_file(file)
      when 'q'
        exit
      else
        puts "skipping ~/.#{file.sub('.erb', '')}"
      end
    end
  else
    link_file(file)
  end
  replace_all
end

def executable_exists?(command)
  exit_value = `hash #{command} 2>/dev/null; echo $?`
  Integer(exit_value) == 0
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end


