format long;

n=60;
X = zeros(n,6);
Y = zeros(n,6);
ERR = zeros(n,1);
iteration = 1;

for j = 1:10
    b = B(:,j);
    for k = 1:6
       
        C = BIGC(:,:,k);
        
        x = (E\b);
        z = (E+epsilon*C)\b;
        
        ERR(iteration) = (norm(z-x,1)/norm(x,1))/(norm(epsilon*C,1)/norm(E));
        iteration = iteration + 1;
        
    end
end

fprintf('cond(E,1) = %.15e\n',cond(E,1));
fprintf('1/rcond(E) = %.15e\n',1/rcond(E));
fprintf('Average = %e\n', mean(ERR));
fprintf('Median = %e\n', median(ERR));
fprintf('Maximum = %e\n', max(ERR));


hold on;
yline(cond(E,1),'-', 'displayname', 'k_1(E)');
yline(1/rcond(E),'-','displayname','1/k_1(E)');
legend;
plot(ERR, 'linestyle', 'none', 'marker', '.');
title('Perturbations of the matrix A=E');
ylabel('Amplification');
xlabel('Experiment');
set(gca, 'YScale', 'log');
