G = [0 0 0 1 0 0; 
    0 0 1 1 1 1;
    1 1 0 0 0 0;
    0 0 0 0 1 0;
    0 0 0 0 0 1;
    0 0 0 0 1 0];
p = 0.85;

disp(ISCpagerank2(G, p));