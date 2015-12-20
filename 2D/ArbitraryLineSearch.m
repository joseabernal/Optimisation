function [xmin, iter] = ArbitraryLineSearch(f, p)
    iter = 1;
    tol = 0.001;
    repeat = true;
    d1 = [0.5; 0.5];
    d2 = [1; 0];
    while repeat
        d = d1;
        if (mod(iter, 2) == 0)
            d = d2;
        end
        l = Line(f, p, d);
        t = NewtonMethod(l, @dfdx, @d2fdx2, 0, tol);
        pCurrent = p + t .* d;
        DisplayLine(p(1), p(2), pCurrent(1), pCurrent(2));
        DisplayPoint(pCurrent);
        pause(1)
        if (norm(p - pCurrent) <= tol)
            repeat = false;
        end
        p = pCurrent;
        iter = iter + 1;
    end
    xmin = p;
end