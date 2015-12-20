function df = Gradient(f, x)
    h = 0.001;
    df = zeros(length(x), 1);
    for i = 1:length(x)
        diff = zeros(length(x), 1);
        diff(i) = h;
        df(i, 1) = (f(x + diff) - f(x - diff))/(2*h);
    end
end