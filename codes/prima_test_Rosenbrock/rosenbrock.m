n = 20;                
x0 = -ones(n, 1);     


rosen = @(x) sum(100*(x(2:end) - x(1:end-1).^2).^2 + (1 - x(1:end-1)).^2);

fprintf('========== Rosenbrock  (n = %d) ==========\n', n);


[x_unc, f_unc] = prima(rosen, x0);
fprintf('无约束: 最优值 f = %.8f\n', f_unc);


lb_bnd = -inf(n,1);
ub_bnd = zeros(n,1);
[x_bnd, f_bnd] = prima(rosen, x0, [], [], [], [], lb_bnd, ub_bnd);
fprintf('界约束 x<=0: 最优值 f = %.8f\n', f_bnd);


A_lin = ones(1,n);
b_lin = 1;
lb_lin = zeros(n,1);
ub_lin = [];   % 无上界
[x_lin, f_lin] = prima(rosen, x0, A_lin, b_lin, [], [], lb_lin, ub_lin);
fprintf('线性约束 sum(x)<=1, x>=0: 最优值 f = %.8f\n', f_lin);


lb_nlc = zeros(n,1);
ub_nlc = [];   % 无上界
% 非线性约束函数：c(x) = sum(x.^2) - 1 <= 0, 无等式约束
nonlcon = @(x) deal(sum(x.^2) - 1, []);
[x_nlc, f_nlc] = prima(rosen, x0, [], [], [], [], lb_nlc, ub_nlc, nonlcon);
fprintf('非线性约束 sum(x^2)<=1, x>=0: 最优值 f = %.8f\n', f_nlc);

% 保存结果
save('rosenbrock_results.mat', ...
     'x_unc','f_unc','x_bnd','f_bnd','x_lin','f_lin','x_nlc','f_nlc');
fprintf('\n结果已保存至 rosenbrock_results.mat\n');
