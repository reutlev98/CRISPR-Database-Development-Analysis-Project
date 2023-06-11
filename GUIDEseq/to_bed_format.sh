#!/bin/bash‏
readFolder="0.9"
newFolder="bedformat-0.9"
rm -r $newFolder
mkdir $newFolder

cd $readFolder

for f in *; do
echo $f;
cat $f| cut -f1,2,3,4,25,27,30,36,39,41 >>  ../$newFolder/$f"_bed";
done
