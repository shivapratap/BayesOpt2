% Squared Exponential Kernel
% arguments must be 1-d vector of size (n x 1)

function K = SqExpKernel(x1,x2)

K = exp(-0.5 * pdist2(x1,x2).^ 2 );

end