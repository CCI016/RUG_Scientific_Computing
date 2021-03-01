% The give regions and step size from the assignment
x = .105 : .0005 : .345;
y = -0.660 : .0005 : -.420;

n = length(x);
e = ones(n,1);
z0 = x(e,:) + i*y(:,e);

[X,Y] = meshgrid(x,y);
z0 = X + i*Y;

z = zeros(n,n);
c = zeros(n,n);

% The value of depth was given in the assignment
depth = 32;
   for k = 1:depth
      z = z.^2 + z0;
      c(abs(z) < 2) = k;
   end
   
c
image(c)
axis image

colormap(flipud(jet(depth)))
   
