x = .105 : .0005 : .345;
y = -0.660 : .0005 : -.420;

n = length(x);
e = ones(n,1);
z0 = x(e,:) + i*y(:,e);

[X,Y] = meshgrid(x,y);
z0 = X + i*Y;

z = zeros(n,n);
c = zeros(n,n);

xc = 225;
yc = .540;
halfsize =  0.12;
res = 480;
zoom = 1;

x0 = xc - halfsize / zoom;
x1 = xc + halfsize / zoom;

linspace(x0,x1,res);

depth = 32;
   for k = 1:depth
      z = z.^2 + z0;
      c(abs(z) < 2) = k;
   end
   
c
image(c)
axis image

colormap(flipud(jet(depth)))
   
