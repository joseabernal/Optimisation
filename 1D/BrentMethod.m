function [xmin, iter] = BrentMethod(f, a, b, c, tol)
    iter = 0;
    while abs(c-a) > tol
        x = c - 0.5 * ((c-a)^2*(f(c) - f(b)) - (c - b)^2*(f(c)-f(a))) / ((c-a)*(f(c)-f(b)) - (c-b)*(f(c)-f(a)));
        if f(a) >= f(b) && f(b) <= f(x)
            c = x;
        else
            if f(b) >= f(x) && f(x) <= f(c)
                a = b;
                b = x;
            end
        end
        iter = iter + 1;
    end
    xmin = a;
end