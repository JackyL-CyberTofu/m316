format shortE;

A = E;

AINV = inv(A);
AC = inv(AINV);

I = eye(6);

disp('For A=E');
fprintf('norm(A*AINV-I,1) = %.15e\n',norm(A*AINV-I,1));
fprintf('norm(AC-A,1) = %.15e\n', norm(AC-A,1));
