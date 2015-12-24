function [xmin, iter] = GoldenSearch(f, a, b, c, tol)
    iter = 0;
    assert(a <= b && b <= c);
    assert(f(a) >= f(b) && f(b) <= f(c));
    while abs(c - a) > tol
        iter = iter + 1;
        if abs(b-a) > abs(c-b)
            x = b - 0.38197*(b-a);
        else
            x = b + 0.38197*(c-b);
        end
        temp = x;
        x = max(temp, b);
        b = min(temp, b);
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
