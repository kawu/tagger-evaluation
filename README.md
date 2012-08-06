Data preparation scripts for tagger evaluation. 

----------------------------------------------------------
Phase 0 -- data reanalysis and synchronization.

Scripts should be run in the following order:
* to-plain.1.sh
* reana.2.sh
* add-disamb.3.sh

WARNING: Conversion from xml to plain format (realised by
corpus2 tools within the to-plain.1.sh script) does not
always work as expected. Look for "\t " string instances
in the output files and remove them.

----------------------------------------------------------
Phase 1 -- guesser and disambiguator training and tagging.
