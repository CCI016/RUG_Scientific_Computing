G = [0 0 0 1 0 0; 
    0 0 1 1 1 1;
    1 1 0 0 0 0;
    0 0 0 0 1 0;
    0 0 0 0 0 1;
    0 0 0 0 1 0];

A=ISCmarkov_matrix(0.85,G);
[x,iter] = ISCmarkov(A,0.0001,100);
x = sort(x,'descend');
disp(x);
