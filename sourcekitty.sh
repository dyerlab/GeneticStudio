#!/bin/bash

array=(genetic matrix)

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
open docs/index.html

#sourcekitten doc -- -workspace GeneticStudio.xcworkspace -scheme matrix > sk.matrix.output
#sourcekitten doc -- -workspace GeneticStudio.xcworkspace -scheme genetic > sk.genetic.output
#cat sk.matrix.output > sk.output
#cat sk.genetic.output >> sk.output
#jazzy --sourcekitten-sourcefile --min-acl internal sk.output
#open docs/index.html
