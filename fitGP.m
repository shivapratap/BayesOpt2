function gp = fitGP(X, y, bounds, koptions)

% Get the Covariance matrix using Sq Exp Kernel

%K = SqExpKernel(X,X);
K = covSEiso(koptions, X);
invK = K\eye(size(K));

% Store everything in the gp
gp.K = K;
gp.invK = invK;
gp.X = X;
gp.y = y;

gp.bounds = bounds;
gp.besty = max(y);

end
