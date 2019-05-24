# genetic.framework

[![Maintainability](https://api.codeclimate.com/v1/badges/521f663f009f0b2c8429/maintainability)](https://codeclimate.com/github/dyerlab/GeneticStudio/maintainability)

[![Test Coverage](https://api.codeclimate.com/v1/badges/521f663f009f0b2c8429/test_coverage)](https://codeclimate.com/github/dyerlab/GeneticStudio/test_coverage)


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
