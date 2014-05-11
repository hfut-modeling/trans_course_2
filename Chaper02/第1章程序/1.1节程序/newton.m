function x = newton(funname, x0, Maxgen, tol)
% 作用: 通过牛顿迭代算法求解非线性方程组
% 调用方式：  x = newton('f_name',x0)
%            x = newton('f_name',x0,tol)
%
%            x: 最优解
%            funname: 定义方程组的函数名
%            x0: 初始值
%            Maxgen: 最大迭代次数
%            tol: 精度(默认:1e-6)

h = 0.0001;
M = Maxgen;  % 最大迭代次数
if nargin < 4
    tol = 1e-6;
end
x = x0;
xb = x - 999;
n = 0;
while abs(x-xb) > tol
    xb = x;
    if n > M
        break;
    end
    y = feval(funname, x);
    fprintf('  n=%3.0f,  x=%12.5e,  y=%12.5e, \n',n,x,y)
    y_driv = (feval(funname,x+h)-y)/h;
    x = xb-y./y_driv;
    n=  n+1;
end
fprintf('  n=%3.0f,  x=%12.5e,  y=%12.5e, ',n,x,y)
if n > M
    fprintf('\n');
    disp('Warning: iterations exceeds the limitation, probable devergent');
end