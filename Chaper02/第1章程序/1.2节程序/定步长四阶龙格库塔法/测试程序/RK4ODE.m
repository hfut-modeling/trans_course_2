function [x,y] = RK4ODE(fun, xEnd, ini, h)
% RK4ODE   ���Ľ�Runge-Kutta�����ֵ����dy/dx = f(x,y),y(x0) = y0����x��y��ֵ
%
% Synopsis:  [x,y] = RK4ODE(fun, xEnd)
%            [x,y] = RK4ODE(fun, xEnd, ini)
%            [x,y] = RK4ODE(fun, xEnd, ini, h)
%
% Input: fun  = (string) ��ֵ����ĺ���
%        xEnd = ʹ��Euler���Ľ�ֹ��
%        ini  = (optional)��ʼ����[x0 y0]��Ĭ��Ϊ[0 0]
%        h    = (optional)������Ĭ��Ϊ0.05
%
% Output:  y = ��ֵ������x��y�Ľ���ֵ
if nargin < 3
    ini = [0 0];    %��δ����ʼ����������ʼ������Ϊ[0 0]
end

if nargin < 4
    h = 0.05;       %��δ������������������Ϊ0.05
end

ini = ini(:);       %����ʼ����תΪ�������������ж��Ƿ���ȷ
[m,n] = size(ini);
if m ~= 2 | n~= 1
    error('��ʼֵ������һ��������Ԫ�ص�����[x0 y0]');
end
x0 = ini(1);        %��ʼ��x0
y0 = ini(2);        %��ʼ��y0

x = (x0:h:xEnd)';           %����x����
y = y0*ones(length(x), 1);  %��ʼ��y����

for j=2:length(x)
    k1 = h * feval(fun, x(j-1), y(j-1));              %����Runge-Kutta���ĵ��ƹ�ʽ��y(n+1) = y(n) + (k1 + 2*k2 + 2*k3 + k4) / 6
    k2 = h * feval(fun, x(j-1)+h/2, y(j-1)+k1/2);     %                            k1 = h * f( x(n), y(n) )
    k3 = h * feval(fun, x(j-1)+h/2, y(j-1)+k2/2);     %                            k2 = h * f( x(n)+h/2, y(n)+k1/2 )
    k4 = h * feval(fun, x(j-1)+h, y(j-1)+k3);         %                            k3 = h * f( x(n)+h/2, y(n)+k2/2 )
    y(j) = y(j-1) + (k1+2*k2+2*k3+k4)/6;              %                            k4 = h * f( x(n)+h, y(n)+k3 )
end