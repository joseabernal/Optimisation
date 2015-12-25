function [xmin, iter] = SteepestDescent(f, p)
    iter = 1;
    tol = 0.000001;
    repeat = true;
    while repeat
        d = -Gradient(f, p);
        d = d / norm(d);
        l = Line(f, p, d);
        [x1, x2, x3] = EstablishBrackets(l, 0, 1);
        t = GoldenSearch(l, x1, x2, x3, tol);
        pCurrent = p + t .* d;
        display([p pCurrent])
        DisplayLine(p(1), p(2), pCurrent(1), pCurrent(2));
        DisplayPoint(pCurrent);
        display(pCurrent);
        if (norm(p - pCurrent) <= tol || norm(Gradient(f, pCurrent)) <= tol)
            repeat = false;
        end
        p = pCurrent;
        iter = iter + 1;
    end
    xmin = p;
end