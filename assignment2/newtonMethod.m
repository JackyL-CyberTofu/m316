format longG;

%Number of Iterations
n = 11;

%Initial Point
x = -1;
fprintf('\nat i=1 %g',x);

for i = 2:n
    
    fprintf('\n');
    
    % f(x) = x^5-x^4+x^3-x^2+1
    pCurrent = vpa(x^5-x^4+x^3-x^2+1);
    pDerivative = vpa(5*x^4-4*x^3+3*x^2-2*x);
    x = vpa(x-pCurrent/pDerivative);
    fprintf('at i=%.16g %.32g',i, x);
    
end

fprintf('\n\n');