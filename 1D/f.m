function [y] = f(x)
    y = -exp(-x.^2) + exp(-(x+1).^2);
end