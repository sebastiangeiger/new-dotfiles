function pop
  set -l file $argv[1]
  sed '1d' $file > tmpfile
  mv tmpfile $file
end

