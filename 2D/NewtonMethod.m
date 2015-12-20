function [xmin, iter] = NewtonMethod(f, dfdx, d2fdx2, x, tol)
    iter = 0;
    repeat = true;
    while repeat
        xCurrent = x - dfdx(f,x)/d2fdx2(f,x);
        iter = iter + 1;
        if (abs(xCurrent - x) <= tol)
            repeat = false;
        end
        x = xCurrent;
    end
    xmin = xCurrent;
end