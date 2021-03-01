% PART 2 Q3
function [x, iter] = ISCmarkov(A, tol, maxiter)
    n = size(A,2);
    x = zeros(n,1);
    
    for dist = 1 : n
        x(dist) = 1 / n;
    end
    
    new_x = x;
    
    for iter = 1 : maxiter
        new_x = A * new_x;
        
        if (norm(abs(x - new_x))) <= tol
            break
        end
        
        x = new_x;
    end

end