# genetic.framework



This swift framework contains the mechanisms for genotype-level genetic analyses.  This includes:  
- Genotype.swift: Base class for missing -> polyploid genotype objects
- Locus.swift: Class for serializing a locus (across individuals) to SQL for cross genome analysis
- Individual.swift: Base class for individuals (stratum, coordinates, and loci)
- Frequencies.swift: Allele (and Heterozygosity) analysis class
- DataSet.swift: Basic class for containing and partitioning individuals among strata.

Documentation for this and other Frameworks in this repository is available [here](https://dyerlab.github.io/GeneticStudio/) 

### Author

Rodney J. Dyer (rjdyer@vcu.edu)

### License

GNU General Public License v3.0
