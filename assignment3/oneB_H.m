
n=60;
ERR = zeros(n,1);
iteration = 1;

for j = 1:10
    b = B(:,j);
    for k = 1:6
       
        C = BIGC(:,:,k);
        
        x = (H\b);
        z = (H+epsilon*C)\b;
        
        ERR(iteration) = (norm(z-x,1)/norm(x,1))/(norm(epsilon*C,1)/norm(H));
        iteration = iteration + 1;
        
    end
end

fprintf('cond(H,1) = %.15e\n',cond(H,1));
fprintf('1/rcond(H) = %.15e\n',1/rcond(H));
fprintf('Average = %e\n', mean(ERR));
fprintf('Median = %e\n', median(ERR));
fprintf('Maximum = %e\n', max(ERR));


hold on;
yline(cond(H,1),'-', 'displayname', 'k_1(H)');
yline(1/rcond(H),'-','displayname','1/k_1(H)');
legend;
plot(ERR, 'linestyle', 'none', 'marker', '.');
title('Perturbations of the matrix A=H');
ylabel('Amplification');
xlabel('Experiment');
set(gca, 'YScale', 'log');
