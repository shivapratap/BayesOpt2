function acq = acq_fun(gp, x_test, new_hyp, acq_str)
    
if strcmp(acq_str,'EI')
    
    [mean_x, sigma_x] = predictGp(gp,x_test,new_hyp);
    if sigma_x == 0
        acq=0;
    else
        
        Z = (gp.besty - mean_x)/sigma_x;
        Phiz= 0.5+0.5*erf(Z/1.4142);
        phiz = (exp(-1*Z.^2/2))/2/506628;        
        acq = -((gp.besty-mean_x)*Phiz + sigma_x*phiz);
        
        
%         diff = ( gp.besty - mean_x );
%         Z = diff/sigma_x;
%         [npdf, ncdf] = stand_normal_stats(Z);
%         acq = -(ncdf.*diff + npdf.*sigma_x);
    end
    
else
    'Invalid option';
    
end

    function [npdf, ncdf] = stand_normal_stats(Z)
        npdf = (2*pi)^(-0.5)*exp(-(Z.^2)/2);
        ncdf = 0.5*(1+erf(Z/sqrt(2)));
    end

end
