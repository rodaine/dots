# lsi - Improved `ls`, applying helpful settings + numeric chmod values

reformat='{
  k=0;
  for(i=0; i<=8; i++)
    k += ((substr($1,i+2,1)~/[rwx]/)*2^(8-i));
  if(k)
    printf("%0o ",k);
  print
}'

function lsi {
  ls -lah --color --group-directories-first "$@" | awk $reformat
}
