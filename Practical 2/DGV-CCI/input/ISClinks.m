load harvard500-2018;
n = size(G,2);

% Function PART 1 point b)
function A = ISClinks(U, G)
    colsum = sum(G);
    rowsum = sum(G, 2);
    diagonal = diag(G);
    A = [];
    x_index = 1;
    for i = 1 : n
        if ((colsum(i) == 2 && rowsum(i) == 2  && diagonal(i) == 1) || (colsum(i) == 1 && (rowsum(i) == 1) && diagonal(i) == 0))
            A(x_index) = U(i);
            x_index = x_index + 1;
            % disp(U(i)) - line to print the output directly
        end    
    end
end 