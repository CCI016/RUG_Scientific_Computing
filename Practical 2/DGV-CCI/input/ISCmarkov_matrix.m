% PART 2 B

function A = ISCmarkov_matrix(p,G)
    n = size(G, 2);
    colsum = sum(G);
    array = zeros(n);
    for i = 1 : n
        for j = 1 : n
            if (colsum(j) == 0)
                array(i, j) = 1/n;
            else
                array(i, j) = p * G(i,j) / colsum(j) + (1 - p)/n;
            end    
        end
    end
    A = array;
end