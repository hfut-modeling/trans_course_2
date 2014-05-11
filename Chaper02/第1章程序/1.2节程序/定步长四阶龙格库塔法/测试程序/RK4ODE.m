function [x,y] = RK4ODE(fun, xEnd, ini, h)
% RK4ODE   用四阶Runge-Kutta法解初值问题dy/dx = f(x,y),y(x0) = y0，在x处y的值
%
% Synopsis:  [x,y] = RK4ODE(fun, xEnd)
%            [x,y] = RK4ODE(fun, xEnd, ini)
%            [x,y] = RK4ODE(fun, xEnd, ini, h)
%
% Input: fun  = (string) 初值问题的函数
%        xEnd = 使用Euler法的截止点
%        ini  = (optional)初始条件[x0 y0]，默认为[0 0]
%        h    = (optional)步长，默认为0.05
%
% Output:  y = 初值问题在x处y的近似值
if nargin < 3
    ini = [0 0];    %若未给初始条件，将初始条件设为[0 0]
end

if nargin < 4
    h = 0.05;       %若未给出步长，将步长设为0.05
end

ini = ini(:);       %将初始条件转为列向量，便于判断是否正确
[m,n] = size(ini);
if m ~= 2 | n~= 1
    error('初始值必须是一个含两个元素的向量[x0 y0]');
end
x0 = ini(1);        %初始化x0
y0 = ini(2);        %初始化y0

x = (x0:h:xEnd)';           %构建x向量
y = y0*ones(length(x), 1);  %初始化y向量

for j=2:length(x)
    k1 = h * feval(fun, x(j-1), y(j-1));              %三阶Runge-Kutta法的递推公式：y(n+1) = y(n) + (k1 + 2*k2 + 2*k3 + k4) / 6
    k2 = h * feval(fun, x(j-1)+h/2, y(j-1)+k1/2);     %                            k1 = h * f( x(n), y(n) )
    k3 = h * feval(fun, x(j-1)+h/2, y(j-1)+k2/2);     %                            k2 = h * f( x(n)+h/2, y(n)+k1/2 )
    k4 = h * feval(fun, x(j-1)+h, y(j-1)+k3);         %                            k3 = h * f( x(n)+h/2, y(n)+k2/2 )
    y(j) = y(j-1) + (k1+2*k2+2*k3+k4)/6;              %                            k4 = h * f( x(n)+h, y(n)+k3 )
end