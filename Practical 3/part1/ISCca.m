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
p=0.6;                               % probability that a cell is alive 
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
