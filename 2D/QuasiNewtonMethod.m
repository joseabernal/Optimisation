function [xmin, iter] = QuasiNewtonMethod(f, p)
    iter = 1;
    tol = 0.001;
    tol2 = 0.00001;
    repeat = true;
    Hinv = eye(length(p), length(p));
    while repeat
        h = -Hinv * Gradient(f, p);
        h = h / norm(h);
        l = Line(f, p, h);
        [x1, x2, x3] = EstablishBrackets(l, 0, 1);
        t = GoldenSearch(l, x1, x2, x3, tol);
        pCurrent = p + t .* h;
        DisplayLine(p(1), p(2), pCurrent(1), pCurrent(2));
        DisplayPoint(pCurrent);
        if (norm(Gradient(f, pCurrent)) <= tol || norm(pCurrent - p) <= tol2)
            repeat = false;
        end
        df = Gradient(f, pCurrent) - Gradient(f, p);
        sk = t * h;
        
        %BFGS update of the Hessian Inverse
        Hinv = Hinv + ((sk'*df + df'*Hinv*df)*(sk*sk'))/(sk'*df)^2;
        Hinv = Hinv - (Hinv*df*sk' + sk*df'*Hinv)/(sk'*df);
        
        p = pCurrent;
        display(p)
        iter = iter + 1;
    end
    xmin = p;
end