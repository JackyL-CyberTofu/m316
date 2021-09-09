format longG;

%Number of Iterations
n = 10;

%Initial Point
x = 1;
fprintf('\nat i=0 %g',x);

for i = 1:n
    
    fprintf('\n');
    
    % f(x) = x^5-x^4+x^3-x^2+1
    pCurrent = x^2-2;
    pDerivative = 2*x;
    x = (pDerivative*x-pCurrent)/pDerivative;
    fprintf('at i=%g %g',i, x);
    
end

fprintf('\n\n');