function [graphs] = getCompactGraphs()
%GETCOMPACTGRAPHS Creates all constrained subgraphs such that each row of the matrix is a graph
%with the following connections [X->Y,Y->Y,Z->Y,X->Z,Y->Z,Z->Z]
choosek = unique(nchoosek(repmat([-1,0,1],1,(6)),(6)),'rows');
graphs = [];

for i = 1:length(choosek)
    % There exists a direct or indirect path from X->Z 
    if abs(choosek(i,4)) || sum(abs(choosek(i,[1,5]))) == 2
        % If Y exists, a direct or indirect path exists from X->Y and a
        % direct path exists from Y->Z
        if max(abs(choosek(i,[1:3,5]))) && (sum(abs(choosek(i,[1,5]))) == 2 || sum(abs(choosek(i,[3:5]))) == 3)
            graphs = [graphs;choosek(i,:)];
        % If Y doesn't exist, graph is valid
        elseif ~max(abs(choosek(i,[1:3,5])))
            graphs = [graphs;choosek(i,:)];
        end
    end
end


