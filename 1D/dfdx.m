function [f1x] = dfdx(f, x)
    h = 0.001;
    f1x = (f(x+h) - f(x-h))/(2*h);
end