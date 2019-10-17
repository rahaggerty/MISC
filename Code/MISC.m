function [sMSE, params_out, graphs] = MISC(datafile,numParam)
% MISC Main code of the MISC algorithm.  Returns the error scores,
% parameters and graphs.

%% Get Input

% Obtain graphs
graphs = getCompactGraphs();
numGraphs = 402;
graphs = graphs(1:numGraphs,:);

% Obtain known arrays
persistent known_X
persistent known_t
persistent known_Z
load(datafile,'known_X','known_t','known_Z');
num_t = length(known_t);

% Obtain parameter bounds
a_ll = 0;
a_ul = 1;
k_ll = 0;
k_ul = 100;
n_ll = 1;
n_ul = 4;

% Obtain number of cells to run on
num_cells =  size(known_X,2);

%% Generate Parameter Sets

a = a_ll + (a_ul-a_ll).*rand(numParam,6).^10;
k = k_ll + (k_ul-k_ll).*rand(numParam,6);
n = n_ll + (n_ul-n_ll).*rand(numParam,6);

persistent params
    if isempty(params)
    params = [a,k,n];
    end
    
params_out = params;
%% Allocate Memory and Constants

sMSE = nan(numGraphs,numParam);

%% Difference Equations

parfor g = 1:numGraphs
    graphx = graphs(g,:);

    for p = 1:numParam
    paramsx = params(p,:);  

    [~, sim_Z]=forwardSimDE(known_X,known_Z,graphx,paramsx,num_t,num_cells);
      sim_t = sum(sum(~isnan(sim_Z)));
    residual = sim_Z-known_Z;
        MSE = nansum(residual.^2)./sim_t;
       sMSE(g,p) = sum(MSE);      
    
    end
    
end
