%POSTPROCESSING Takes the data from MISC and postprocesses it to be used in
%getgraphsnew

sMSE_linear = sMSE(:);
I_graph = mod([1:length(sMSE_linear)],402);
I_graph(I_graph == 0) = 402;
I_parameter = ceil([1:length(sMSE_linear)]./402);
[sMSE_linear_sort,I] = sort(sMSE_linear);
I_graph_sort = I_graph(I);
I_parameter_sort = I_parameter(I);

