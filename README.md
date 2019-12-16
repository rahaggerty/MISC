# MISC
Mechanism Inference from Single Cell Dynamics

Folders-

Code:
Contains all the code necessary to run MISC.  Each file is commented with more details about it's function.
	dataprep.m
	dY_hill.m
	dZ_hill.m
	forwardSimDE.m
	getCompactGraphs.m
	getFit.m
	getgraphsnew.m
	MISC.m
	postprocessing.m
	
Figure 3:
Contains all the input and output files used to generate figure 3.
	IN_IFFL.mat is the input file for MISC containing the synthetic incoherent feedforward loop data.
	OUT_IFFL.mat is the input data run through MISC.

Figure 4:
Contains all the input and output files used to generate figure 4
	IN_<stress>.mat are the input files for each stress (glucose, H2O2, KCl)
	OUT_<stress>.mat are the output files run through MISC corresponding to each of the input files.
	
Figure 5:
Contains all the input and output files used to generate figure 5
	IN_<stress>.mat are the input files for each stress and the IFFL.  These are the same as the ones found in Figure 3 and Figure 4.
	OUT_<stress>_X.mat are the output files run through MISC corresponding to each of the input files.  There are five repeats each, denoted by X.
	IN_<stress>_permY.mat are the input files for each stress and the IFFL with the ordering of paired input and output shuffled.  There are five repeats each, denoted by X.
	OUT_<stress>_permY.mat are the output files run through MISC corresponding to each of the input files.
	
Figure 6:
Contains all the input and output files used to generate figure 6
	IN_<stress>_X_randY.m are the input files for each stress and the IFFL with X cells randomly selected from the complete set.  There are five repeats each, denoted by Y.
	OUT <stress>_X_randY.m are the output files run through MISC corresponding to each of the input files.
