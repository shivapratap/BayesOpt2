function X_init = getSamplesBO(numSamples, nDim, bounds)
%  getSamples   
%
%   input: 
%   output:

lb = bounds(1,:);
ub = bounds(2,:);

X_init = zeros(numSamples, nDim);

for ii = 1:numSamples        
    X_init(ii,:) = lb + (ub - lb) .* rand(1,nDim);    
end

end