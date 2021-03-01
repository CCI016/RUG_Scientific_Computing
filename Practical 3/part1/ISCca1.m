%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Introduction to Scientific Computing - WBCS14003              %
%                                                               %
%  Simulate spatial pattern formation in Matlab                 %
%  via cellular automata                                        %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;                                 % clear the command window 
close all                            % close open figure windows      
clear all;                           % remove items from the workspace

n=64;                                % number of cells horizontally/vertically
p=0.2;                               % probability that a cell is alive 
max_gen=100;                         % maximal number of generations

% Initialize matrix A 
imname='random';                     % name of the pattern
A=rand(n,n)<p;                       % n x n matrix A with random zeroes/ones
                                     % expected number of living cells is p (for n large)

% Print the initial fraction of living cells on the screen
fprintf('initial fraction of living cells=%f\n',sum(sum(abs(A)))/n^2);

% Display the initial pattern of living and dead cells as an image 
% The living cells are white, the dead cells black. 
figure;                              % open a figure window
imHandle = imagesc(A,[0 1]);         % display the matrix A as an image. 
                                     % The value range of A is [0 1].
colormap(gray);                      % set a gray scale color table

% Write the image to a PNG file
gen=1;                               % current generation number 
imfile = [imname,'_n=',int2str(n),'_p=',num2str(p),'_gen=',int2str(gen),'.png'];
imwrite(A, imfile);                  % write A 

% Expand matrix A to matrix A1 because of the extra borders needed
A1=zeros(n+2,n+2);                   % initialise (n+2)x(n+2) matrix with zeroes 
A1(2:n+1,2:n+1)=A;                   % Insert matrix A in matrix A1 

% Now compute the successive generations via the majority rule. 
% The algorithm should terminate as soon as no more differences 
% occur between successive generations.

% Here comes your code ....
for g = 1 : max_gen
    A_current = A1;
    for i = 2 : (n + 1)
        for j = 2 : (n + 1)   
            if (A_current(i,j) == 0)
                x =  getValue(A_current, 1, i, j); 
                if (x == 1) 
                    A1(i,j) = 1; 
                end
            end
                
            if (A_current(i,j) == 1)
                x = getValue(A_current, 0, i, j); 
                if (x == 1)
                    A1(i,j) = 0;
                end
            end
        end  
    end
    set(imHandle, 'CData' , A1);
    drawnow ;
    pause(0.1);
    if (isequal(A1,A_current == true))
        fprintf('initial fraction of living cells=%f\n',sum(sum(abs(A1)))/n^2);
        imfile = [imname,'_n=',int2str(n),'_p=',num2str(p),'_gen=',int2str(g),'.png'];
        imwrite(A1, imfile);               
        break;    
    end
    A_current = A1;
end

function x=getValue(Arr, state, row, col)
    counter = 0;
    for r = (row - 1) : (row + 1)
        for c = (col - 1) : (col + 1)
            if (((r ~= row) || (c ~= col)) && (Arr(r,c) == state))
                counter = counter + 1;
            end
        end
    end
    if (counter > 4)
        x = 1;
    else
        x = 0;
    end
    
end