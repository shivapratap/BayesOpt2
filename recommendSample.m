function [xnew]  = recommendSample(gp, acq_type, koptions)

% Initialize variables
bounds = gp.bounds;
xgrid = bounds(1):0.1:bounds(2);

mu  = zeros(length(xgrid),1);
sig = zeros(length(xgrid),1);
acq = zeros(length(xgrid),1);

% For each point in the grid, get mu, sig and acq
for i = 1:length(xgrid)
    
%     k = diag(SqExpKernel(repmat(xgrid(i), size(gp.X)), gp.X));
    k = covSEiso(koptions, gp.X, xgrid(i));
    mu(i)  = k'* gp.invK * gp.y;
    sig(i) = SqExpKernel(xgrid(i),xgrid(i)) - k'* gp.invK * k;
    
    % Acq function
    switch acq_type
        
        case 1   % PI
            var = (mu(i) - gp.besty - eta)/sig(i);
            acq(i) = cdf('Normal', var, mu(i), sig(i));
            
        case 2  % EI
            if sig(i) == 0
                acq(i) = 0;
            else
                Z = (mu(i) - gp.besty)/sig(i);
                PHI_Z = cdf('Normal', Z, mu(i), sig(i));
                phi_Z = pdf('Normal', Z, mu(i), sig(i));
                acq(i) = (mu(i) - gp.besty) * PHI_Z + sig(i) * phi_Z;
            end
            
        otherwise
            disp('Invalid Acq')
            break;
    end % switch
end % for

% update GP using PI
% Get the max value of PI
[maxPI, maxind] = max(acq);
xnew = xgrid(maxind);

% Plot the function and acq
plotbo(xgrid, gp, acq, mu, sig)



end
