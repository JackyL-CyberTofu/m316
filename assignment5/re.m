h = 0.25;
t0 = 1;
tn = 2;
y0 = 2;

hold on
[x,y_eu] = euler(h,t0,tn,y0);
plot(x,y_eu,'LineWidth',2);
[x,y_me] = me(h,t0,tn,y0);
plot(x,y_me,'LineWidth',2);
[x,y_h2] = heun2(h,t0,tn,y0);
plot(x,y_h2,'LineWidth',2);
[x,y_h3] = heun3(h,t0,tn,y0);
plot(x,y_h3,'LineWidth',2);
[x,y_rk] = rk(h,t0,tn,y0);
plot(x,y_rk,'LineWidth',2);

y_actual = @(t) (4+cos(2)-cos(2.*t))./(2.*t.^2);
fplot(y_actual,[t0,tn],'LineWidth',3,'Color','k');
grid on
legend("Euler","Modified Euler","Heun 2nd","Heun 3rd","Runge-Kutta")


y = y_actual(x);
err = [y_eu-y,y_me-y,y_h2-y,y_h3-y,y_rk-y];
figure
bar(err)


%function in the differential equation
function f = f(t,y)

f = 1+y/t;

end

%% ALGORITHMS (for solving oddes)

function [x,y] = euler(h,t0,tn,y0)

x = linspace(t0,tn,(tn-t0)/h+1)';
n = length(x);

y = zeros(n,1);
y(1) = y0;

for i = 2:n
    
    a = h*f(x(i-1),y(i-1));
    y(i) = y(i-1) + a;
    
end

end


function [x,y] = me(h,t0,tn,y0)

x = linspace(t0,tn,(tn-t0)/h+1)';
n = length(x);

y = zeros(n,1);
y(1) = y0;

for i = 2:n

    a = h*f(x(i-1),y(i-1));
    b = h*f(x(i-1)+h/2,y(i-1)+a/2);
    y(i) = y(i-1) + b;
    
end

end


function [x,y] = heun2(h,t0,tn,y0)

x = linspace(t0,tn,(tn-t0)/h+1)';
n = length(x);

y = zeros(n,1);
y(1) = y0;

for i = 2:n

    a = h*f(x(i-1),y(i-1));
    b = h*f(x(i-1)+h,y(i-1)+a);
    y(i) = y(i-1) + (a+b)/2;
    
end

end

function [x,y] = heun3(h,t0,tn,y0)

x = linspace(t0,tn,(tn-t0)/h+1)';
n = length(x);

y = zeros(n,1);
y(1) = y0;

for i = 2:n

    a = h*f(x(i-1),y(i-1));
    b = h*f(x(i-1)+h/3,y(i-1)+a/3);
    c = h*f(x(i-1)+2*h/3,y(i-1)+2*b/3);
    y(i) = y(i-1) + (a+3*c)/4;
    
end

end


function [x,y] = rk(h,t0,tn,y0)

x = linspace(t0,tn,(tn-t0)/h+1)';
n = length(x);

y = zeros(n,1);
y(1) = y0;

for i = 2:n

    a = h*f(x(i-1),y(i-1));
    b = h*f(x(i-1)+h/2,y(i-1)+a/2);
    c = h*f(x(i-1)+h/2,y(i-1)+b/2);
    d = h*f(x(i-1)+h,y(i-1)+c);
    y(i) = y(i-1) + (a+2*b+2*c+d)/6;
    
end

end