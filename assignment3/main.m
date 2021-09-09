
n=100;
X = zeros(n,6);
Y = zeros(n,6);
ERR = zeros(n,6);
iteration = 1;
for j = 1:10
    b = B(:,j);
    for k = 1:10
        d = D(:,k);
        
        
        x = (E\b);
        y = E\(b+epsilon*d);
        ERR(iteration) = (norm(y-x,1)/norm(x,1))/(norm(epsilon*d,1)/norm(b,1));
        iteration = iteration + 1;
        
    end
end

plot(ERR, 'linestyle', 'none', 'marker', '.');
set(gca, 'YScale', 'log')
