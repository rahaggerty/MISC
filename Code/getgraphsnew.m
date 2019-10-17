% GETGRAPHSNEW Postprocessing, defining the cutoff of significant topologies, determine and plot the top subgraphs

% Load a MISC input and output file into the workspace before running this
% script

postprocessing;

% Create a matrix of subgraphs x graphs and fill in which subgraphs each
% graph has
subgraphs = zeros(16080000,402);
for i = 1: 16080000
  subgraphs(i,:)  = sum((abs(graphs(I_graph_sort(i),:) - 2*graphs))'< 2)==6;
end

% Find the errors for each topology
[~, sim_Z]=forwardSimDE(known_X,known_Z,[0 0 0 0 0 0],params(1,:),length(known_t),size(known_X,2));
sim_t = sum(sum(~isnan(sim_Z)));
residual = sim_Z-known_Z;
MSE = nansum(residual.^2)./sim_t;
sMSE_null = sum(MSE);
sMSE_linear_sort_less_than_null = sMSE_linear_sort(find(sMSE_linear_sort<sMSE_null));

% Use the errors to determine the cutoff using the first derivative
dydx = diff(sMSE_linear_sort_less_than_null,1);
mean_dydx = movmean(dydx,50); %for smoothing
n = find(mean_dydx <= 0.01*max(mean_dydx),1);

% Plot errors and first derivative
figure;
subplot(2,1,1),plot(sMSE_linear_sort_less_than_null(1:n))
subplot(2,1,2),plot(mean_dydx(1:n))

% Determine how many times each subgraph appears before the cutoff
score = zeros(402,1);
for i = 1: 402
    score(i) = sum(subgraphs(1:n,i));  
end
[score_sort, I_score] = sort(score, 'descend');

% Plot the top topologies
load('cmap_red2blk_v2.mat')
figure;imagesc(graphs(I_graph_sort(1:n),:)')
colormap(cmap_red2blk_v2)

% Plot the top 10 subgraphs
figure;
subplot(2,1,1); imagesc(graphs(I_score(1:10),:)')
colormap(cmap_red2blk_v2)
subplot(2,1,2); plot(score_sort(1:10)./n, '-o')

% Plot the known_Z versus Z simulated by the best subgraph
% Determine the number of the best subgraph and put that in the workspace
% as g before running the following code
x = getFit(known_X,known_Z,graphs(g,:),params(I_parameter_sort(find(subgraphs(:,g),1)),:),length(known_t),size(known_X,2));
[~, sim_Z]=forwardSimDE(known_X,known_Z,graphs(g,:),x,length(known_t),size(known_X,2));

figure;
subplot(1,2,1); imagesc(known_Z', [min(min(known_Z)),max(max(known_Z))])
subplot(1,2,2); imagesc(sim_Z', [min(min(known_Z)),max(max(known_Z))])