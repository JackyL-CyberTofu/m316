format long g;

%Number of Iterations
n = 11;

%Initial Point
xOne = -0.786;
xTwo = -0.6;

for i = 3:n
    
    fprintf('\n');
    
    pCurrent = vpa(xOne^5-xOne^4+xOne^3-xOne^2+1);
    pNext = vpa(xTwo^5-xTwo^4+xTwo^3-xTwo^2+1);
    
    x = vpa(((pNext-pCurrent)/(xTwo-xOne))*xOne-pCurrent)/((pNext-pCurrent)/(xTwo-xOne));
    
    xOne = xTwo;
    xTwo = x;
    
    fprintf('at i=%.16g %.32g',i, x);
    
end

fprintf('\n\n');
fprintf('%.16g',pi);