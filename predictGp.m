function [mean_x,sigma_x]= predictGp(gp, x_test, new_hyp)

L=gp.L;
x=gp.X;

% Predicitve Mean
Kstar  = covSEiso(new_hyp, x, x_test);
mean_x = Kstar' * gp.L * gp.y;

% Predicitve Variance
kstarstar = new_hyp(2); % this is your kvar
sigma1 = Kstar' * gp.L * Kstar;
sigma_x = sqrt(kstarstar-min(sigma1,new_hyp(2)));

end