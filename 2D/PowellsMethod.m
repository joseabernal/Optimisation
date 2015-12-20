function [xmin, iter] = PowellsMethod(f, p)
    iter = 1;
    tol = 0.001;
    repeat = true;
    U = [1 0; 0 1];
    while repeat
        i = 1;
        p0 = p;
        display(U)
        while i <= 2
            d = U(:, i);
            l = Line(f, p, d);
            t = NewtonMethod(l, @dfdx, @d2fdx2, 0, tol);
            pCurrent = p + t .* d;
            DisplayLine(p(1), p(2), pCurrent(1), pCurrent(2));
            DisplayPoint(pCurrent);
            pause(0)
            p = pCurrent;
            iter = iter + 1;
            i = i + 1;
        end
        U(:, 1) = U(:, 2);
        display([pCurrent p0 pCurrent - p0])
        U(:, 2) = pCurrent - p0;
        U(:, 2) = U(:, 2) / norm(U(:, 2));
        
        d = U(:, 2);
        l = Line(f, pCurrent, d);
        t = NewtonMethod(l, @dfdx, @d2fdx2, 0, tol);
        pCurrent = pCurrent + t .* d;
        DisplayLine(p(1), p(2), pCurrent(1), pCurrent(2));
        DisplayPoint(pCurrent);
        p = pCurrent;
        display(pCurrent)
        if (norm(p0 - pCurrent) <= tol)
            repeat = false;
        end
    end
    xmin = p;
end