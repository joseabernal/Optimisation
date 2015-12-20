function f = Ellipse(a, b)
    f = @(t) [a*cos(t); b*sin(t)];
end