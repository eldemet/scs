function set_pars(solver_ops)
%SET_PARS is used to set the SuperSCS parameters in a CVX
%context.
% 
%Syntax:
%set_pars(solver_ops)
%
%Input arguments:
%solver_ops  solver options is a structure with the
%            following fields:
%             alpha - relaxation parameter
%             beta - step size reduction coefficient
%             c1 - parameter to check condition at K1
%             c_bl - parameter for blind updates
%             cg_rate - for indirect, tolerance goes down like (1/iter)^cg_rate
%             direction - choice of direction (100: restarted Broyden, 150:
%                         Anderson's acceleration, 200: FPR)
%             do_super_scs - whether SuperSCS should be activated (if not,
%                           the legacy SCS code is executed).
%             eps - the solver tolerance
%             k0 - activation of k0 steps
%             k1 - activation of k1 steps
%             k2 - activation of k2 steps
%             ls - maximum number of linesearch steps
%             memor - memory of direction (Broyden/Anderson)
%             normalize - heuristic data rescaling (on/off) 
%             rho_x - scaling parameter rho_x
%             scale - if normalized, rescales by this factor
%             sigma - linesearch parameter
%             sse - parameter q defining a summable sequence
%             thetabar - parameter for Broyden directions
%             verbose - verbosity level (0/1/2)
%             do_record_progress - whether to record progress data when 
%                                  running SuperSCS (slows down execution).
%             warm_start - warm start
%             max_iters - maximum number of iterations
%             max_time_milliseconds - SuperSCS can be instructed to stop
%                                     after a certain time (in ms). The
%                                     default value is 300000ms, that is 5
%                                     minutes
%             dumpfile - where to store solver info (preferably, full path)
%             use_indirect - whether to use the indirect method
%


% --- Important Note: In MATLAB, the solver tolerance corresponds to
% parameter `tolerance`. This is mapped to `eps` because this is how the C
% code will receive it. 
cvx_solver_settings(...
    'alpha', solver_ops.alpha, ...
    'beta', solver_ops.beta,...
    'c1', solver_ops.c1, ...
    'c_bl', solver_ops.c_bl, ...
    'cg_rate', solver_ops.cg_rate, ...
    'direction', solver_ops.direction, ...
    'do_super_scs',solver_ops.do_super_scs, ...
    'eps', solver_ops.tolerance,...
    'k0', solver_ops.k0, ...
    'k1', solver_ops.k1, ...
    'k2', solver_ops.k2, ...
    'ls',  solver_ops.ls, ...
    'memory', solver_ops.memory, ...
    'normalize', solver_ops.normalize, ...
    'rho_x', solver_ops.rho_x, ...
    'scale', solver_ops.scale, ...
    'sigma', solver_ops.sigma,...
    'sse', solver_ops.sse,...
    'thetabar', solver_ops.thetabar,...
    'verbose', solver_ops.verbose, ...
    'do_record_progress', solver_ops.do_record_progress,...
    'warm_start', solver_ops.warm_start,...
    'max_iters', solver_ops.max_iters, ...
    'max_time_milliseconds', solver_ops.max_time_milliseconds)

if ~isempty(solver_ops.dumpfile),
    cvx_solver_settings('dumpfile', solver_ops.dumpfile);
else
    % --- if no file is provided, use /temp/temp.mat.
    cvx_solver_settings('dumpfile', fullfile(get_scs_rootdir,'temp','temp.mat'));
end

% --- the default is the indirect mode...
if ~isempty(solver_ops.use_indirect),
    cvx_solver_settings('use_indirect', solver_ops.use_indirect);
else
    cvx_solver_settings('use_indirect', 1);
end