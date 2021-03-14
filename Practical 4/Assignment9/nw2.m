in=fopen('input.txt'); 
s=fgetl (in);
t=fgetl (in);
fclose (in);
len_s = length ( s ) ; 
len_t = length(t);

p = 0;
q = 4;
g = 5;

D = zeros(len_s + 1, len_t + 1);
P = repmat('*',[len_s + 1, len_t + 1]);

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
    end
end

function x = w(a, b, p, q)
    if (a == b) 
        x = p;
    else
        x = q;
    end
end

function x = predecessor(match, delete, insert, minimal)
    a = '-';
    if (delete == minimal)
        a = '|';
    end
    if (insert == minimal)
        a = '-';
    end
    if (match == minimal)
        a = '\';
    end
    x = a;
end