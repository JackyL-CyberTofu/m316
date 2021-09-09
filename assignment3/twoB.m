format shortE;

A = H;

AINV = inv(A);
AC = inv(AINV);

I = eye(6);

disp('For A=H');
fprintf('norm(A*AINV-I,1) = %.15e\n',norm(A*AINV-I,1));
fprintf('norm(AC-A,1) = %.15e\n',norm(AC-A,1));
fprintf('norm(AINV-HI,1) = %.15e\n',norm(AINV-HI,1));
