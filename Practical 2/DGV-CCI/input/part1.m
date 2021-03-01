load harvard500-2018;

n = size(G,2); 
total_elements = n * n;

% PART 1 Q3 - a)
for p = 1 : 50
    if ( nnz(G ^ p) == nnz ( G ^ (p + 1) ) )
        fprintf('The power p where the number of non-zeros stops increasing is %d\n', p);
        break
    end
end

% PART 1 Q3 - b)
fraction = nnz(G ^ p) / total_elements * 100;

% PART 1 Q3 - c )
for i = 1:7
    subplot(3,3,i)
    spy(G^i)
end






