%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
p=0.6;                               % probability that a cell is sleeping
q = 0.2;                             % probability that a cell is alive
max_gen=100;                         % maximal number of generations

% Initialize matrix A 
imname='random3';                     % name of the pattern
R=rand(n,n); % matrix with random values between 0 and 1
A=(R>1-p-q)+(R>1-p); % matrix A with random values 0,1,2
 
% Print the initial fraction of living cells on the screen
fprintf('initial fraction of dead cells=%f\n',sum(sum(abs(A == 0)))/n^2);
fprintf('initial fraction of sleeping cells=%f\n',sum(sum(abs(A == 1)))/n^2);
fprintf('initial fraction of living cells=%f\n',sum(sum(abs(A == 2)))/n^2);

% Display the initial pattern of living and dead cells as an image 
% The living cells are white, the dead cells black. 
figure;                              % open a figure window
imHandle = imagesc(A,[0 2]);         % display the matrix A as an image. 
colorbar                                     % The value range of A is [0 1].
colormap(gray);                      % set a gray scale color table

% Write the image to a PNG file
gen=1;                               % current generation number 
imfile = [imname,'_n=',int2str(n),'_p=',num2str(p),'_q=',num2str(q),'_gen=',int2str(gen),'.png'];
imwrite(rescale(A), imfile);                  % write A 

% Expand matrix A to matrix A1 because of the extra borders needed
A1=zeros(n+2,n+2);                   % initialise (n+2)x(n+2) matrix with zeroes 
A1(2:n+1,2:n+1)=A;                   % Insert matrix A in matrix A1 

% Now compute the successive generations via the majority rule. 
% The algorithm should terminate as soon as no more differences 
% occur between successive generations.

% Here comes your code ....
pause(1)
for g = 1 : max_gen
    A_current = A1;
    for i = 2 : (n + 1) 
        for j = 2 : (n + 1)  
            AX = A_current(i-1:i+1,j-1:j+1);
            x = getValue(AX, 0, 2 ,2);
            y = getValue(AX, 1, 2 ,2);
            z = getValue(AX, 2, 2 ,2);
            if (x == 1)
                A1(i,j) = 0;
            elseif (y == 1)
                A1(i,j)= 1;
            elseif (z == 1)
                A1(i,j)= 2;
            end
        end  
    end
    set(imHandle, 'CData' , A1);
    drawnow ;
    pause(0.1);
    if (isequal(A1,A_current) == true)
        fprintf(' fraction of dead cells=%f\n',sum(sum(abs((A_current(2:n+1,2:n+1))== 0)))/n^2);
        fprintf(' fraction of sleeping cells=%f\n',sum(sum(abs((A_current(2:n+1,2:n+1)) == 1)))/n^2);
        fprintf(' fraction of living cells=%f\n',sum(sum(abs((A_current(2:n+1,2:n+1)) == 2)))/n^2);
        
        imfile = [imname,'_n=',int2str(n),'_p=',num2str(p),'_q=',num2str(q),'_gen=',int2str(g),'.png'];
        imwrite(rescale(A1), imfile);
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