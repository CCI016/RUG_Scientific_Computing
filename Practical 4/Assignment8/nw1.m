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
        D(i,j) = minimal(match, delete, insert);
    end
end

function x = w(a, b, p, q)
    if (a == b) 
        x = p;
    else
        x = q;
    end
end

function x = minimal(a,b,c)
    if (a > b && a > c)
        x = a;
    end
    if (b > c && b > a)
        x = b;
    end
    if (c > a && c > a)
        x = c;
    end
end