require 'rake'
require 'erb'

task :default => :install

desc "install the dot files into user's home directory"
task :install => [:symlink_dotfiles, :change_default_shell, :checkout_oh_my_zsh, :install_vundle] do
  if `uname` =~ /Darwin/
    Rake::Task["mac"].invoke
  end
end

task :mac => [:install_homebrew]

task :rvm do
  system "curl -L get.rvm.io | bash -s stable"
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

task :checkout_oh_my_zsh do
  if File.exists?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "Oh-my-zsh is already installed"
  else
    oh_my_zsh = File.join(ENV['HOME'], ".oh-my-zsh")
    system "git clone git://github.com/sebastiangeiger/oh-my-zsh.git #{oh_my_zsh}"
    system "(cd #{oh_my_zsh} && git remote add robbyrussell git://github.com/robbyrussell/oh-my-zsh.git && git fetch robbyrussell && git checkout --track -b robby_master robbyrussell/master && git checkout master)"
  end
end

task :change_default_shell do
  if `env | grep SHELL` =~ /zsh$/
    puts "Default shell is zsh"
  elsif executable_exists?("zsh")
    puts "Setting zsh as default shell"
    system "chsh -s $(which zsh)"
    puts "Logout and login again so can enjoy your shiny new zsh!"
  else
    $stderr.puts "Please install zsh, then run 'rake change_default_shell'"
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
  (IO.read("homebrews").split("\n").reject{|app| app.strip.empty?} - installed_homebrews).each do |application|
    system "brew install #{application}"
  end
end

task :symlink_dotfiles do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.md LICENSE TODO.tasks].include? file
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


