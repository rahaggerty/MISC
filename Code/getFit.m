function x = getFit(known_X,known_Z,graph,params,num_t,num_cells)
% GETFIT Finds the parameters that optimize the given graph, starting at
% params.

% Parameter ranges
a_ll = 0*ones(1,6);
a_ul = 1*ones(1,6);
k_ll = 0.01*ones(1,6);
k_ul = 100*ones(1,6);
n_ll = 1*ones(1,6);
n_ul = 4*ones(1,6);

% Find best parameters
fminconopt = optimoptions(@fmincon,'Display','iter-detailed','Algorithm','active-set');
optimfun = @(params)runSim(known_X,known_Z,graph,params,num_t,num_cells);
[x,fval,exitflag,output] = fmincon(optimfun,params,[],[],[],[],[a_ll,k_ll,n_ll],[a_ul,k_ul,n_ul],[],fminconopt);

end

function [sMSE] = runSim(known_X,known_Z,graph,params,num_t,num_cells)
% Fitting function
    [~, sim_Z]=forwardSimDE(known_X,known_Z,graph,params,num_t,num_cells);
    sim_t = sum(sum(~isnan(sim_Z)));
    residual = sim_Z-known_Z;
    MSE = nansum(residual.^2)./sim_t;
    sMSE = sum(MSE);      
end