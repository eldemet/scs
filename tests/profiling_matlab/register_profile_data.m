function register_profile_data(o, tol, problem_type, id, records)
    fid = fopen('profile_results/register.csv', 'a');
        fprintf(fid, '%s,%d,%d,%g,%g,%g,%g,%g,%g,%g,%d,%d,%d,%d,%d,%d,%d,%d,%g,%g,%g,%g,%g,%d,%d,%d,%d,%d\n',...
            problem_type,id,length(records),sum([records.cost]/1e3),tol,o.alpha,o.beta,o.c1,o.c_bl,o.cg_rate,o.direction,o.do_super_scs,o.k0,o.k1,o.k2,o.ls,o.memory,...
            o.normalize,o.rho_x,o.scale,o.sigma,o.sse,o.thetabar,o.verbose,o.do_record_progress,o.use_indirect,...
            o.max_iters,o.warm_start);
end