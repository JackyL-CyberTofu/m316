format longG;

%Number of Iterations
n = 11;

lowerBound = 0;
upperBound = 4;

fprintf('\n');

for i = 1:n
    
    x = (upperBound-lowerBound)/2;
    
    fprintf('at i=%.16g %.32g \n',i,x);
    
    %Change Function Here
    result = x^3-6*x^2+9*x-3;
    
    if result>0
        upperBound = x;
    else
        lowerBound = x;
    end
    
end
fprintf('\n');