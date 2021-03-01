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
for g = 1 : max_gen
    A_current = A1;
    for i = 2 : (n + 1) %Forul pentru randuri
        for j = 2 : (n + 1)  %Forul pentru coloane
            % doua ifuri in foul acesta verifica daca celula e vie sau
            % moarta
            if (A_current(i,j) == 0) % e moarta
                x =  getValue(A_current, 1, i, j); %vede daca in apropiere sunt mai mult de 4 vii
                if (x == 1) %verifica daca trebuie de inviat
                    A1(i,j) = 1; % o invie
                end
            end
                
            if (A_current(i,j) == 1) % e vie
                x = getValue(A_current, 0, i, j);  %vede daca in apropiere sunt mai mult de 4 morti
                if (x == 1)
                    A1(i,j) = 0; % o omoara nahui
                end
            end
        end  
    end
    %aici prosta se printeaza si se verifica daca am ajuns la final, poti
    %sa nu vnicaesti
    % treb di pus si saveul la imagine, iasna?
    set(imHandle, 'CData' , A1);
    drawnow ;
    pause(0.1);
    if (isequal(A1,A_current == true))
        fprintf('initial fraction of living cells=%f\n',sum(sum(abs(A1)))/n^2);
        break;    
    end
    A_current = A1;
end


%crce functia asta lucreaza asa:
% inchipuieti un patrat de 3x3 si celula pe care o verificam e in centru
% pai ea verifica daca ce-i inafara satisface conidtia, gen numara cati
% morti sau vii sunt, eu ii dau toata matricea(ea plbm va lucra daor cu un
% patrat 3x3), stateul asta ce sa caute(0 morti, 1 viu), row si col asta-i
% pozitia la celula noastra
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