require File.expand_path('helper/package_list', File.dirname(__FILE__))
require File.expand_path('helper/symlinker', File.dirname(__FILE__))
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

desc "complies vim extensions YouCompleteMe"
task :compile_you_complete_me => [:install_vundle, :install_packages] do
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
    system %Q{/usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"}
  end
  installed_homebrews = `brew list`.split("\n")
  (PackageList.from_file("Packagefile").list_for(:mac) - installed_homebrews).each do |application|
    system "brew install #{application}"
  end
end

task :install_with_apt_get do
  repositories = PackageList.from_file("Packagefile").repositories_for(:linux)
  unless repositories.empty?
    system "sudo apt-get install -y python-software-properties"
    repositories.each do |repository|
      system "sudo add-apt-repository -y #{repository}"
    end
  end
  system "sudo apt-get update"
  list = PackageList.from_file("Packagefile").list_for(:linux)
  available = `sudo apt-cache pkgnames`.split(/\n/)
  available_in_list = Set.new(list).intersection(available).to_a
  missing = list - available_in_list
  File.open(File.join(ENV['HOME'], "missing_packages.txt"), "w") do |file|
    file.write(missing.join("\n"))
  end
  system "sudo apt-get -y install #{available_in_list.join(" ")}"
end

desc "Symlink all files from the current directory into $HOME"
task :symlink_dotfiles do
  Symlinker.new(from: File.dirname(__FILE__), to: ENV['HOME'])
    .ignore(%w[Rakefile README.md LICENSE TODO.tasks Packagefile helper])
    .prepend_names_with(".")
    .link!
end

def executable_exists?(command)
  exit_value = `hash #{command} 2>/dev/null; echo $?`
  Integer(exit_value) == 0
end
