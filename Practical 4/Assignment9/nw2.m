in=fopen('nw_test1.txt');
s=fgetl (in);
t=fgetl (in);
fclose (in);
len_s = length ( s ) ; 
len_t = length(t);

% Test values from the assignment
p = 0;
q = 4;
g = 5;

% Allocating enough memory for the resulting and predecessor matrix
D = zeros(len_s + 1, len_t + 1);
P = repmat('*',[len_s + 1, len_t + 1]);

% Needleman-Wunsch Algorithm (9.1 in Reader)
for i = 1 : (len_s + 1)
    D(i,1) = ((i - 1) * g);
    if (i ~= 1 )
        P(i,1) = '|';
    end
end

for j = 1 : (len_t + 1)
    D(1,j) = (j - 1) * g;
    if (j ~= 1 )
        P(1,j) = '-';
    end
end

for i = 2 : (len_s + 1)
    for j = 2 : (len_t + 1)
        match = D(i - 1, j - 1) + w(s(1, i - 1), t(1,j - 1), p, q);
        delete = D(i - 1, j) + g;
        insert = D(i, j - 1) + g;
        minimal = min([match, delete, insert]);
        D(i,j) = minimal;
        P(i,j) = predecessor(match, delete, insert, minimal);
        % P - Matrix that contains characters that indicate the direction of
        % the predecessors
    end
end

fprintf("D=\n");
disp(D);
fprintf("P=\n");
disp(P);

% Function to compute the output value of the scoring matrix.
function x = w(a, b, p, q)
    if (a == b) 
        x = p;
    else
        x = q;
    end
end

% This function is used to compute the sign that indicates 
% the direction of the predecessor
function sign = predecessor(match, delete, insert, minimal)
    if (delete == minimal)
        sign = '|';
    end
    if (insert == minimal)
        sign = '-';
    end
    if (match == minimal)
        sign = '\';
    end
end