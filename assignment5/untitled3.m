
m = 5;
x = linspace(-1,1,m);
y = 1./(1+30.*x.^2); 

n = 5;
intx = linspace(-1,1,n);
inty = 1./(1+30.*x.^2);
z = spline(intx,inty,x);

nz = csape(intx,inty,'second');
nz = fnval(nz,x);

plot(intx,inty,'.','MarkerSize',20)
hold on
%plot(x,y,'LineWidth',2)
hold on
%plot(x,z,'LineWidth',1.5)
hold on
plot(x,nz,'LineWidth',1.5)
grid on
%legend('Interpolation points','Function graph','Cubic spline','Natural spline','Location','sw')