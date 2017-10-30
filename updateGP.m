function gp = updateGP(gp, x_new, ynew, koptions)

gp.y = [gp.y;ynew];
gp.X = [gp.X;x_new'];

% Sort the points 
[gp.X, sorted.ids] = sort(gp.X);
gp.y = gp.y(sorted.ids);

%gp.K = SqExpKernel(gp.X, gp.X);
gp.K = covSEiso(koptions, gp.X);

gp.invK = gp.K\eye(size(gp.K));
gp.besty = max(gp.y);

end