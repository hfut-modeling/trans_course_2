function x = newton(funname, x0, Maxgen, tol)
% ����: ͨ��ţ�ٵ����㷨�������Է�����
% ���÷�ʽ��  x = newton('f_name',x0)
%            x = newton('f_name',x0,tol)
%
%            x: ���Ž�
%            funname: ���巽����ĺ�����
%            x0: ��ʼֵ
%            Maxgen: ����������
%            tol: ����(Ĭ��:1e-6)

h = 0.0001;
M = Maxgen;  % ����������
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