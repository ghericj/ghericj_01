function [EMA] = exponentialMovingAverage(priceSeries, windowPeriod)
% This function computes the exponential moving average of a price series using a specified window period.

% Input validation
if ~isnumeric(priceSeries) || ~isnumeric(windowPeriod)
    error('Inputs must be numeric');
end
if ~isvector(priceSeries) || length(priceSeries) < windowPeriod
    error('Price series must be a vector with length greater than or equal to window period');
end
if windowPeriod <= 0
    error('Window period must be a positive integer');
end

% Precompute alpha and beta coefficients
alpha = 2 / (windowPeriod + 1);
beta = 1 - alpha;

% Compute EMA using a loop
n = length(priceSeries);
EMA = NaN(n, 1);
EMA(windowPeriod) = mean(priceSeries(1:windowPeriod));
for i = windowPeriod+1:n
    EMA(i) = alpha * priceSeries(i) + beta * EMA(i-1);
end

end
