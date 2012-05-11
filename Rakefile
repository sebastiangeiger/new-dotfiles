require 'rake'
require 'erb'

desc "install the dot files into user's home directory"

task :install => [:symlink_dotfiles, :change_default_shell, :checkout_oh_my_zsh, :install_vundle] do
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
    system "git clone git://github.com/robbyrussell/oh-my-zsh.git #{File.join(ENV['HOME'], ".oh-my-zsh")}"
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

task :symlink_dotfiles do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.md LICENSE].include? file
    
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
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
  end
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


