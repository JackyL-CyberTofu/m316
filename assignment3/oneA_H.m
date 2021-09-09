
n=100;
X = zeros(n,6);
Y = zeros(n,6);
ERR = zeros(n,1);
iteration = 1;

for j = 1:10
    b = B(:,j);
    for k = 1:10
        d = D(:,k);
        
        
        x = (H\b);
        y = H\(b+epsilon*d);
        ERR(iteration) = (norm(y-x,1)/norm(x,1))/(norm(epsilon*d,1)/norm(b,1));
        iteration = iteration + 1;
        
    end
end

fprintf('k_1(H) = %e\n',cond(H,1));
fprintf('Average = %e\n', mean(ERR));
fprintf('Median = %e\n', median(ERR));
fprintf('Maximum = %e\n', max(ERR));

hold on;
yline(cond(H,1),'-','k_1(H)');
title('Perturbations in the right-hand side A=H');
ylabel('Amplification');
xlabel('Experiment');
plot(ERR, 'linestyle', 'none', 'marker', '.');
set(gca, 'YScale', 'log');
