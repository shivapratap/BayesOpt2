function X_rescaled = rescaleData(Xscaled, scalebounds)
%  normalise   
%
%   input: X 
%   output: X_rescaled 


min = scalebounds(1,:);
max = scalebounds(2,:);
range = max - min;

X_rescaled = bsxfun(@plus, (Xscaled .* range), min);

end