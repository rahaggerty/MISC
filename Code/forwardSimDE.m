function [sim_Y, sim_Z]= forwardSimDE(known_x,known_Z,graphx,paramsx,num_t,num_cells)
% FORWARDSIMDE Simulates Y and Z given the known_X, known_Z, graph,
% parameters, time and number of cells

Y_prev = ones(1, num_cells);
Z_prev = known_Z(1,:);
sim_Y = nan(num_t,num_cells);
sim_Z = nan(num_t,num_cells);


t = 1;
        while t <= num_t
            Y_curr = Y_prev + dY_hill(known_x(t,:),Y_prev,Z_prev,graphx,paramsx(1:6),paramsx(7:12),paramsx(13:18));
            Z_curr = Z_prev + dZ_hill(known_x(t,:),Y_prev,Z_prev,graphx,paramsx(1:6),paramsx(7:12),paramsx(13:18));
            sim_Y(t,:) = Y_curr;
            sim_Z(t,:) = Z_curr;
            Y_prev = Y_curr;
            Z_prev = Z_curr;
            t=t+1;
        end