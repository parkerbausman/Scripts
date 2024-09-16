This is a collection of scripts used during my masters thesis. Some are old and poorly organized. For questions about the research or proper workflow email parker.bausman@maine.edu

A lot has changed and there is a LOT of outdated stuff in this pipeline. At the moment ACFloating(ND or not) and floating20xx are the best and synchronous datasets 

- Raw data is input into "Float combine" where my two datasets are merged
    - UNKxxx are given random numbers to make sure there are no duplicate measures per pond 
- "LW-Dry-Mass" then uses length weight regressions to determine an estimate for dry mass per sample. Final product = "EMERGE" 
- "Nemo_Other_DW" subsets nemo emergence and all other insect emergence numbers. These are raw emergence values, not adjusted for per/m2
- "NemoVSEmerge" does a few things: 
  - First, it finds the total emergence in mg
  - *there is a break in the R workflow here. I took the data of total emergence per sample period and in a new excel sheet I divided that number across the sampling period to find emergence/day. I might code this in r but its honestly easier to do in excel* 
  - Then it merges the two datasets
  - Then it graphs the nemo and all other bugs (mg/day) over time 

