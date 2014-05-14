function vim
  if type reattach-to-user-namespace > /dev/null
    reattach-to-user-namespace vim $argv
  else
    /usr/bin/vim $argv
  end
end
