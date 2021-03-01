% Computing the filled Julia set, for c = -.85 . Region of the z0-plane: [−2, 2] × [−2, 2].
res = 480;
x0 = 2;
x1 = -2;
x = linspace(x0,x1,res);

y0 = 2;
y1 = -2;
y = linspace(y0,y1,res);
 
[X,Y] = meshgrid(x,y);
z = X + i*Y;

c = -.85;
B = zeros(size(c));

% Number of maximum iterations is 50
max_iter = 50;
   for k = 1:max_iter;
      z = z.^2 + c;
      B = B + (abs(z) < 2);
   end
   
imagesc(B)
colormap(flipud(jet))
axis image
