complete -x -c install_public_key -d "Host" -a "(__fish_print_hostnames)"
complete -x -c install_public_key -d "SSH Public Key" -a "(ls ~/.ssh/*.pub)"
