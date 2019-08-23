#!/bin/sh
#test
# author : Francois Gardavaud
# version date : 16-05-2019
# purpose : script to avoid dupplicate transfert on the same distant host
# in my case eliminate the following block in .proto files
# the structure is in my case :
# AutoXferHostInfo {
# autoXferHostName = "AWS"
# autoXferMode = 1
# }
# /!\/!\/!\/!\ the deletion is only effective if and only if the previous lines are consecutive /!\/!\/!\/!\

linesref=('    AutoXferHostInfo {' \
'      autoXferHostName = "AWS"' \
'      autoXferMode = 1' \
'    }' \
)

n=${#linesref[*]}

declare -a lines

i=0
while IFS= read lines[$i] ; do
let i++
if [ $i -eq $n ] ; then
block=true
for (( j=0; j < $n; j++ )); do
[ "${lines[$j]}" != "${linesref[$j]}" ] && block=false
done
if [ $block == true ] ; then
let i=0
else
echo "${lines[0]}"
for (( j=1; j < $n; j++ )); do
let k=$j-1
lines[$k]=${lines[$j]}
done
let i--
fi
fi
done
for (( j=0; j < $i; j++ )) ; do
echo "${lines[$j]}"
done
