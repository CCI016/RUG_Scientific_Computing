% The step size was subject to changes from 0.0005 to 0.0001 during
% different tests, this is the last value from the last test.
x = .205 : .0001 : .245; 
y = -.560 : .0001 : -.520;

[X,Y] = meshgrid(x,y);
z0 = X + i*Y;

n = length(x);
z = zeros(n,n);
c = zeros(n,n);
%The depth size was subject to changes (16, 64 and 256) during different
%tests, this is the last value from last test.

depth = 256;
   for k = 1:depth
      z = z.^2 + z0;
      c(abs(z) < 2) = k;
   end
   
c
image(c)
axis image

colormap(flipud(jet(depth)))