in=fopen('nw_test1.txt');
s=fgetl (in);
t=fgetl (in);
fclose (in);
len_s = length(s) ; 
len_t = length(t);

% For our commodity and overall readability we decided to chage t_al, s_al and l_al into the fpllowing variables.
s_string = '';
t_string = '';
line_string = '';
row = len_s + 1;
column = len_t + 1;

% Test values from the assignment
p = 0;
q = 4;
g = 5;

% Allocating enough memory for the resulting and predecessor matrix
D = zeros(len_s + 1, len_t + 1);
P = repmat('*',[len_s + 1, len_t + 1]);

% Needleman-Wunsch Algorithm (9.1 in Reader)
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
        % P - Matrix that contains characters that indicate the direction of
        % the predecessors
    end
end

while (row > 0 && column > 0)
    
    if (P(row,column) == '|')
        line_string = [' ', line_string];
        t_string = ['-', t_string];
        s_string = [s(row - 1), s_string];
        row = row - 1;
    end
    
     if (P(row,column) == '-')
        line_string = [' ', line_string];
        t_string = [t(column - 1), t_string];
        s_string = ['-', s_string];
        column = column - 1;
    end
    
    if (P(row,column) == '\')
        if (s(row - 1) ~= t(column - 1)) % Mismatch
            line_string = [' ', line_string];
            t_string = [t(column - 1), t_string];
            s_string = [s(row - 1), s_string];
        else
            line_string = ['|', line_string]; % Match
            t_string = [t(column - 1), t_string];
            s_string = [s(row - 1), s_string];
        end
        row = row - 1;
        column = column - 1;
    end

     if (P(row,column) == '*')
        row = row - 1;
        column = column - 1;
    end
end

% Displaying the Alignment in the console
disp(s_string);
disp(line_string);
disp(t_string);

% Writing the output of all the parts (matrix D, matrix P, Alignment) into a single file
output=fopen('nw3−output.txt', 'w');
fprintf(output,'Name : <Cainarean Constantin(S4142152) && Denis Garabajiu(S4142551) >\n');
fprintf(output,'IBC, Practical 4 \n\n');

  fprintf(output,'\n\nString S: ');
  for i=1:length(s)
    fprintf(output,'%2c',s(i));
  end
  fprintf(output,'\n\nString T: ');
  for i=1:length(t)
    fprintf(output,'%2c',t(i));
  end

  fprintf(output,'\n\nMatrix D:\n\n');
  for i = 1:len_s + 1
      for j = 1:len_t + 1
          fprintf(output, '%4d', D(i,j));
      end
      
      fprintf(output,'\n');
  end

  fprintf(output,'\n\nMatrix P:\n\n');
  for i = 1:len_s + 1
      for j = 1:len_t + 1
          fprintf(output, '%2c', P(i,j));
      end
      fprintf(output,'\n');
  end

  fprintf(output,'\n\nAlignment:\n\n');
  
  for i = 1:length(s_string)
      fprintf(output, '%2c', s_string(i));
  end

  fprintf(output,'\n');
  
  for i = 1:length(line_string)
      fprintf(output, '%2c', line_string(i));
  end
  
  fprintf(output,'\n');
  
  for i = 1:length(t_string)
      fprintf(output, '%2c', t_string(i));
  end
  fclose(output);                            % close file



% Function to compute the output value of the scoring matrix.
function x = w(a, b, p, q)
    if (a == b) 
        x = p;
    else
        x = q;
    end
end

% This function is used to compute the sign that indicates 
% the direction of the predecessor
function sign = predecessor(match, delete, insert, minimal)
    if (delete == minimal)
        sign = '|';
    end
    if (insert == minimal)
        sign = '-';
    end
    if (match == minimal)
        sign = '\';
    end
end