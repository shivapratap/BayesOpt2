function gp = fitGP(X, y, xbounds, ybounds, koptions)

% Get the Covariance matrix using Sq Exp Kernel

%K = SqExpKernel(X,X);
K = covSEiso(koptions, X);
invK = K\eye(size(K));

% Store everything in the gp
gp.K = K;
gp.invK = invK;
gp.X = X;
gp.y = y;

gp.xbounds = xbounds;
gp.ybounds = ybounds;

gp.besty = max(y);

end