#!/bin/sh
# this script is used to find and sort the zero size blastn files NH

fdir="/ufrc/burleigh/nhans/summer2017/bird/NucGb/0-Data"; # path to the data where each order name is present
zero="zeroed.new2.txt"; # this file is generated by find . -type f -name "*.blastn" -size 0 >zeroed.new2.txt
file="whyzero.txt" # this is output file which is generated at the end of this script 

printf "folder\t zeroblastnfiles \n" ; # column headers
for f in "${fdir}/"*.tar.gz; # for each order name in the original data(bird orders) folder
 do
  dab=$(echo $f| cut -f 9 -d '/'); #cut by / and saves the entire names of blastn
  justname=$(echo $dab | cut -f 1 -d '.'); # saves just the names
  echo $justname;
  old=$(grep $justname $zero | wc -w); # counts how many lines(not times) each order is present in the zero file
  printf "$justname \t $old \n" ; # How many files in the folder are zero 
 done > "$file" 

sort -k 2 -g $file;

# why not count the number of times?
# because in each line the name occures twice, once as the blastn file and once as the folder name
# example
# ./flag_corvidae/NAT15.corvidae.blastn

