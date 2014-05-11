function [u2,v2,h,err] = self(x1,y1,h)
% 
%  该函数用来调整自适应
%
u1=x1;%u1为x1的备份，供步长为h/2时计算下一个节点时使用
v1=y1;%v1为y1的备份，供步长为h/2时计算下一节点数值解时使用

%用四阶经典公式计算步长为h时第1个节点处的数值解
k1=myfun(x1,y1);
k2=myfun(x1+h/2,y1+h*k1/2);
k3=myfun(x1+h/2,y1+h*k2/2);
k4=myfun(x1+h,y1+h*k3);
y2=y1+h*(k1+2*k2+2*k3+k4)/6;

%四阶经典公式计算步长为h/2时的第一个节点处的数值解
h=h/2;

for i=1:2
    k1=myfun(u1,v1);
    k2=myfun(u1+h/2,v1+h*k1/2);
    k3=myfun(u1+h/2,v1+h*k2/2);
    k4=myfun(u1+h,v1+h*k3);
    v2=v1+h*(k1+2*k2+2*k3+k4)/6;
    u2=u1+h;
    u1=u2;
    v1=v2;
end

err=abs(y2-v2);
