#!/usr/bin/env zsh
# generates host files using compiled blocklist

git submodule update --remote --no-fetch

host_dir="./hostfiles"
host_files=(
  "${host_dir}/hosts.mine"
  "${host_dir}/hosts.work"
)

tool_dir="${host_dir}/hosts"
target_file="${tool_dir}/myhosts"
script_file="${tool_dir}/updateHostsFile.py"

#ensure their existence
for file in $host_files; do
  touch $file
done

cat $host_files >! $target_file

python $script_file -a -b -f -r
