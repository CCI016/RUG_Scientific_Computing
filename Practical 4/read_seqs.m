in=fopen('input.txt');               % open input file
s=fgetl(in);                         % read line 1 of the input
t=fgetl(in);                         % read line 2 of the input
fclose(in);                          % close file
len_s=length(s);                     % length string s
len_t=length(t);                     % length string t

% Here comes your code
.................
% The result should be a matrix $D$ containing the costs of optimal alignment
