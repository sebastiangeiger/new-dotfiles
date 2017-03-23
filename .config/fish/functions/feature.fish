function feature
	set -l branch_name (echo $argv | tr '[:upper:]' '[:lower:]' | sed -e 's/ /-/g')
  git checkout -b "sebastiangeiger/$branch_name"
end
