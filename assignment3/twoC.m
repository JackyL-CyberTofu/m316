format shortE;

A = H8;

AINV = inv(A);
AC = inv(AINV);

I = eye(8);

fprintf('norm(A*AINV-I,1) = %.15e\n',norm(A*AINV-I,1));
fprintf('norm(AC-A,1) = %.15e\n',norm(AC-A,1));
fprintf('norm(AINV-HI8,1) = %.15e\n',norm(AINV-HI8,1));
fprintf('cond(H8,1) = %.15e\n',cond(H8,1));