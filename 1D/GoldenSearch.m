function [xmin, iter] = GoldenSearch(f, a, b, c, tol)
    iter = 0;
    assert(a < b && b < c && f(a) >= f(b) && f(b) <= f(c));
    while abs(c - a) > tol
        iter = iter + 1;
        x = a+(c-a)*(1-0.38197);
        if x < b
            tmp = x;
            x = b;
            b = tmp;
        end
        if f(a) >= f(b) && f(b) <= f(x)
            c = x;
        else
            if f(b) >= f(x) && f(x) <= f(c)
                a = b;
                b = x;
            end
        end
    end
    xmin = a;
end
