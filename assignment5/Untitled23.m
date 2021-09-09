%% wiggle wiggle wiggle

%for plot
m = 2000;
x = linspace(-1,1,m)';

%function
y = sin(6.*x)+sin(70.*exp(x));

%barycentric interpolation with equally spaced nodes
n = 37;
ips = linspace(-1,1,n)';
f = sin(6.*ips)+sin(70.*exp(ips));

Eq = barycentric_form(ips,f,x);

%barycentric interpolation with Chebyshev nodes
n = 110;
angles = linspace(0,pi,n)';
ips = cos(angles);
f = sin(6.*ips)+sin(70.*exp(ips));

Cheby = barycentric_form(ips,f,x);

% figure
% plot(x,y)
% 
% figure
% plot(x,y)
% hold on
% plot(x,Eq)
% 
% 
% figure
% plot(x,y)
% hold on
% plot(x,Cheby)


%% devil horns

%for plot
m = 2000;
x = linspace(-1,1,m)';

%function
y = 1./(1+gamma(x+0.5).^2) - 1./sqrt(1+gamma(x-0.3).^2);

%barycentric interpolation with equally spaced nodes
n = 50;
ips = linspace(-1,1,n)';
f = 1./(1+gamma(ips+0.5).^2) - 1./sqrt(1+gamma(ips-0.3).^2);

Eq = barycentric_form(ips,f,x);

%barycentric interpolation with Chebyshev nodes
n = 940;
angles = linspace(0,pi,n)';
ips = cos(angles);
f = 1./(1+gamma(ips+0.5).^2) - 1./sqrt(1+gamma(ips-0.3).^2);

Cheby = barycentric_form(ips,f,x);

% figure
% plot(x,y)

figure
% plot(x,y)
% hold on
plot(x,Eq)


% figure
% plot(x,y)
% hold on
% plot(x,Cheby)
% title('we want')


%% barycentric form
function p = barycentric_form(ips,f,x)

n = size(ips,1);
m = size(x,1);

w = ones(n,1);

for i = 1:n
    
    for k = 1:n
        
        if i ~= k
            w(i) = w(i)*(ips(i)-ips(k));
        end
        
    end
    
    w(i) = 1/w(i);
    
end

numer = zeros(m,1);
denom = zeros(m,1);

for i = 1:n
    
    numer = numer + f(i)*w(i)./(x-ips(i));
    denom = denom + w(i)./(x-ips(i));
    
end

p = numer./denom;

end
