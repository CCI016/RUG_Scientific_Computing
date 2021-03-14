in=fopen('nw_test1.txt'); 
s=fgetl (in);
t=fgetl (in);
fclose (in);
len_s = length(s) ; 
len_t = length(t);

% Test values from the assignment
p = 0;
q = 4;
g = 5;

% Allocating enough memory for the resulting matrix
D = zeros(len_s + 1, len_t + 1);

% Needleman-Wunsch Algorithm (9.1 in Reader)

for i = 1 : (len_s + 1)
    D(i,1) = ((i - 1) * g);
end

for j = 1 : (len_t + 1)
    D(1,j) = (j - 1) * g;
end

for i = 2 : (len_s + 1)
    for j = 2 : (len_t + 1)
        match = D(i - 1, j - 1) + w(s(1, i - 1), t(1,j - 1), p, q);
        delete = D(i - 1, j) + g;
        insert = D(i, j - 1) + g;
        D(i,j) = min([match, delete, insert]);
    end
end

% Function to compute the output value of the scoring matrix.
function val = w(a, b, p, q)
    if (a == b) 
        val = p;
    else
        val = q;
    end
end