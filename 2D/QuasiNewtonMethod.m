function [xmin, iter] = QuasiNewtonMethod(f, p)
    iter = 1;
    tol = 0.001;
    repeat = true;
    Hinv = eye(length(p), length(p));
    while repeat
        d = -Gradient(f, p);
        h = -Hinv * d;
        h = h / norm(h);
        l = Line(f, p, h);
        t = NewtonMethod(l, @dfdx, @d2fdx2, 0, tol);
        pCurrent = p + t .* h;
        DisplayLine(p(1), p(2), pCurrent(1), pCurrent(2));
        DisplayPoint(pCurrent);
        if (norm(p - pCurrent) <= tol || norm(Gradient(f, pCurrent)) == 0)
            repeat = false;
        end
        df = Gradient(f, pCurrent) - Gradient(f, p);
        dx = pCurrent - p;
        Hinv = Hinv + dx'*(df - Hinv*dx)/(dx'*dx);
        p = pCurrent;
        iter = iter + 1;
    end
    xmin = p;
end