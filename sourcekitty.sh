#!/bin/bash

array=(DLCommon DLGenetic DLPopgraph GeneticStudio)

# Remove existing structures
rm -rf docs
rm -rf *.output
touch sk.output

# Cycle through the modules
for i in ${array[@]};
do
	echo "Running $i ------------------------------------------------------"
	sourcekitten doc -- -project ./$i/$i.xcodeproj -scheme $i >> sk.output
done

perl -0pe 's/\]\n\[/,/g' sk.output  > geneticstudio.output
jazzy --sourcekitten-sourcefile geneticstudio.output
