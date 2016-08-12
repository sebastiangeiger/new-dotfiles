function git-install-pre-push-hook
  set -l root (git rev-parse --show-toplevel)
  set -l hook_file $root"/.git/hooks/pre-push"

  set -l template "#!/bin/sh
remote='\$1'
url='\$2'

echo '.git/hooks/pre-push: Computer says no!'
exit 1"

  [ ! -f $hook_file ]; and echo $template > $hook_file
  chmod +x $hook_file
end
