function [xmin, iter] = LevenbergMarquart(f, p, k, mu)
    iter = 1;
    tol = 0.00001;
    repeat = true;
    I = eye(length(p), length(p));
    N = size(f(p), 1);
    while repeat
        F = 0.5 * norm(f(p))^2;
        J = Jacobian(f, p, N);
        H = J' * J;
        h = (H + mu * I) \ (-J' * f(p));
        FCurrent = 0.5 * norm(f(p + h))^2;
        display((p + h)')
        if FCurrent >= F
            mu = mu*k;
        else
            mu = mu/k;
            p = p + h;
        end
        
        if (norm(FCurrent - F) <= tol)
            repeat = false;
        end
        iter = iter + 1;
    end
    xmin = p;
end