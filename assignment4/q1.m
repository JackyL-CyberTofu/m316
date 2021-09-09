
for i=1:100
    %1a
    B = -1 + (1+1)*rand(50,50);
    %1b
    [Q,~] = qr(B);
    %1c
    Qarray(:,:,i) = Q;
    epsilon = 10^(-8);
    perturbations(:,:,i) = Q*epsilon;
end

%2a
J = diag(ones(1,49),1);

for i=1:100
    %2b
     A = 4*J;
     eig2B = eig(A);
     cond2B = cond(A);
     graphTwoB(:,:,i) = eig(A+perturbations(:,:,i));
end

for i=1:100
    %2c
     A = 4*J+4*J^2;
     eig2C = eig(A);
     cond2C = cond(A);
     graphTwoC(:,:,i) = eig(A+perturbations(:,:,i));
end

for i=1:100
    %3ab
     L1 = diag(ones(1,49),-1);
     L2 = -2*diag(ones(1,50));
     L = L1+L2;
     A = inv(L)*J;
     eig3B = eig(A);
     cond3B = cond(A);
     graphThreeB(:,:,i) = eig(A);
end

for i=1:100
    %3ac
     L1 = diag(ones(1,49),-1);
     L2 = -2*diag(ones(1,50));
     L = L1+L2;
     A = inv(L)*J;
     eig3C = eig(A);
     cond3C = cond(A);
     graphThreeC(:,:,i) = eig(A+perturbations(:,:,i));
end

for i=1:100
    %4a
    r = linspace(-2,2,50);
    p = poly(r);
    
    %4b
    A = compan(p);
    
    %4c
    eig4C = eig(A);
    cond4C = cond(A);
    graphFourC(:,:,i) = eig(A+perturbations(:,:,i));
end

%4d
M = 2*rand(50)-1;
[W,R] = qr(M);
B = W*diag(r)*W';

for i=1:10
eig4Da = eig(B);
eig4Db(:,:,i) = eig(B+perturbations(:,:,i));
eig4Dc(:,:,i) = eig(B+epsilon*(Qarray(:,:,i)+transpose(Qarray(:,:,i))));
disp(min(eig4Db(:,:,i)));
disp(max(eig4Db(:,:,i)));
disp(mean(eig4Db(:,:,i)));
end

% PLOTTING GRAPHS
figure(1);
for i=1:100
    hold on;
    plot(graphTwoB(:,:,i),'.');
    title('A=4J');
end
hold off;
figure(2);
for i=1:100
    hold on;
    plot(graphTwoC(:,:,i),'.');
    title('A=4J+4J^2');
end
hold off;
figure(3);
for i=1:100
    hold on;
    plot(graphThreeB(:,:,i),'.');
    title('A=L^(-1)*U (Just A)');
end
hold off;
figure(4);
for i=1:100
    hold on;
    plot(graphThreeC(:,:,i),'.');
    title('A=L^(-1)*U');
end
hold off;
figure(5);
for i=1:100
    hold on;
    plot(graphFourC(:,:,i),'.');
    title('A=compan');
end
