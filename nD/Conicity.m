function dist = Conicity(data)
    % based on https://www.cs.cornell.edu/cv/OtherPdf/Ellipse.pdf

    x = data(:, 1);
    y = data(:, 2);
    
    A = [x.^2, x .* y, y.^2, x, y, ones(length(x), 1)];
    
    dist = @(parameters) A * parameters;
end