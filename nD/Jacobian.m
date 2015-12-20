function df = Jacobian(f, x, N)
    h = 0.001;
    df = zeros(N, length(x));
    for i = 1:length(x)
        diff = zeros(length(x), 1);
        diff(i) = h;
        df(:, i) = (f(x + diff) - f(x - diff))./(2*h);
    end
end