function install_public_key
	set -l public_key (cat $argv[2])
  set -l command "touch ~/.ssh/authorized_keys; echo '"$public_key"' >> ~/.ssh/authorized_keys"
  ssh $argv[1] "$command"
  echo "Installed $argv[2] on $argv[1]"
end

