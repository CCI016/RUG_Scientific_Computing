  output=fopen('nw3-output.txt', 'w');      % open file
  fprintf(output,'Name: <Your name(s)>\n'); % enter your name(s)
  fprintf(output,'IBC, Practical 3\n\n');

  fprintf(output,'\n\nString s:\n');
  for i=1:length(s)
    fprintf(output,'%s',s(i));
  end
  fprintf(output,'\n\nString t:\n');
  for i=1:length(t)
    fprintf(output,'%s',t(i));
  end

  fprintf(output,'\n\nMatrix D:\n\n');
% Here comes the code for printing matrix D

  fprintf(output,'\n\nMatrix P:\n\n');
% Here comes the code for printing matrix P

  fprintf(output,'\n\nAlignment:\n\n');
% Here comes the code for printing the alignment 
% That is, strings s_al, l_al, t_al below one another (aligned)

  fclose(output);                            % close file
