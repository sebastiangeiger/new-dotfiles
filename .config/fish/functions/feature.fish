function feature
  set -l branch_name (echo $argv | sed -e 's/ /-/g')
  git checkout -b "sebastiangeiger/$branch_name"
end
