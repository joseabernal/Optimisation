function fx = CuadraticFunction(A, b, c)
    fx = @(x) 0.5.*x'*A*x - b'*x + c;
end