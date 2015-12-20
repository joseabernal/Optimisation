function [xmin, iter] = SteepestDescent(f, p)
    iter = 1;
    tol = 0.001;
    repeat = true;
    while repeat
        d = -Gradient(f, p);
        d = d / norm(d);
        l = Line(f, p, d);
        t = NewtonMethod(l, @dfdx, @d2fdx2, 0, tol);
        pCurrent = p + t .* d;
        %display([p pCurrent])
        DisplayLine(p(1), p(2), pCurrent(1), pCurrent(2));
        DisplayPoint(pCurrent);
        if (norm(p - pCurrent) <= tol || norm(Gradient(f, pCurrent)) == 0)
            repeat = false;
        end
        p = pCurrent;
        iter = iter + 1;
    end
    xmin = p;
end