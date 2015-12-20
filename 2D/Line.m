function line = Line(f, P, D)
    line = @(t) f(P+t.*D);
end