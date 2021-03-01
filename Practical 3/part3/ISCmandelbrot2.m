% The given values from the assignment to get the image from 7A
xc = .225;
yc = -.540;
halfsize =  0.12;
res = 480;
zoom = 1;

% Calculating the region
x0 = xc - halfsize / zoom;
x1 = xc + halfsize / zoom;
x = linspace(x0,x1,res);

y0 = yc - halfsize / zoom;
y1 = yc + halfsize / zoom;
y = linspace(y0,y1,res);

[X,Y] = meshgrid(x,y);
z0 = X + i*Y;

n = length(x);
z = zeros(n,n);
c = zeros(n,n);

% Same depth as in 7A to be able to get the same image.
depth = 32;
   for k = 1:depth
      z = z.^2 + z0;
      c(abs(z) < 2) = k;
   end
   
c
image(c)
axis image

colormap(flipud(jet(depth)))
   
