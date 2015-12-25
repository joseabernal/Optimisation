% Based on http://www.pha.jhu.edu/~neufeld/numerical/lecturenotes7.pdf
function [x1, x2, x3] = EstablishBrackets(f, x1, x2)
    repeat = true;
    while repeat
        d = abs(x1 - x2);
        if f(x1) < f(x2)
            x3 = x1 - d;
        else
            x3 = x2 + d;
        end
    
        if f(x3) > min(f(x1), f(x2))
            repeat = false;
        else
            if f(x2) > f(x1)
                x2 = x1;
            end
            x1 = x3;
        end
    end
    result = [x1 x2 x3];
    [~, order] = sort(result);
    x1 = result(order(1));
    x2 = result(order(1));
    x3 = result(order(1));
end