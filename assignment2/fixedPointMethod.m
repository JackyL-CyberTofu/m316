format longG;
syms y;

%Number of Iterations
n = 11;

%Initial Point
x = -1;
fprintf('\nat i=1 %g \n',x);

for i = 2:n
    
    %Change Function Here
    %Bounded by (inf,-0.43)
    x = x^3-6*x^2+9*x-3;
    fprintf('at i=%.16g %.32g \n',i,x);
    
end

fprintf('\n');