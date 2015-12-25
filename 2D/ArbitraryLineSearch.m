function [xmin, iter] = ArbitraryLineSearch(f, p)
    iter = 1;
    tol = 0.001;
    repeat = true;
    d1 = [1; 0];
    d2 = [0; 1];
    
    while repeat
        d = d1;
        if (mod(iter, 2) == 0)
            d = d2;
        end
        l = Line(f, p, d);
        [x1, x2, x3] = EstablishBrackets(l, 0, 1);
        t = GoldenSearch(l, x1, x2, x3, tol);
        pCurrent = p + t .* d;
        DisplayLine(p(1), p(2), pCurrent(1), pCurrent(2));
        DisplayPoint(pCurrent);
        display(pCurrent)
        if (norm(p - pCurrent) <= tol)
            repeat = false;
        end
        p = pCurrent;
        iter = iter + 1;
    end
    xmin = p;
end