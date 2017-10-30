function [X_scaled] = normaliseData(X, bounds)
%  normalise   Normalise the columns of a matrix/vector
%
%   input: X - a matrix or vector
%   output: X_scaled = matrix/vector with columns normalized between 0 and 1

min = bounds(1,:);
max = bounds(2,:);

X_scaled = bsxfun(@rdivide, bsxfun(@minus, X, min), (max - min));

end