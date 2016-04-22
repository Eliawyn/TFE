function [ xbar ] = mean1( x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
n = length(x);
xbar = x(1);
for i = 2:n
    xbar = xbar + x(i);
end
xbar = xbar/n;
end

