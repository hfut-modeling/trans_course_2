function main
%
%  测试主函数
%
% 判断测试方程存在与否
if exist('myfun.m')==0
    disp('没有为方程创建名为myfun.m的函数文件,请参照下例建立它');
    disp('function z=myfun(x,y)');
    disp('z=y-2*x/y;');
    disp('并将该文件保存在work文件夹下');
end

X1=input('请输入求解区间的左端点X1=');
Y1=input('请输入微分方程的初始条件Y1=（X=X1时Y的值）');
Xn=input('请输入求解区间的右端点Xn=');
h=input('请输入求解步长h=');

X=X1;
Y=Y1;        %运算初始点
n=0;         %节点序号变量置零

while X<=Xn-h
    K1=myfun(X,Y);
    K2=myfun(X+h/2,Y+K1*h/2);
    K3=myfun(X+h/2,Y+K2*h/2);
    K4=myfun(X+h,Y+K3*h);
    X=X+h;
    Y=Y+h*(K1+2*K2+2*K3+K4)/6;      %四阶标准的龙格-库塔公式
    n=n+1;                          %节点序号加1
    
    fprintf('第%d个点的计算结果为X=%10.8f,Y=%10.8f\n',n,X,Y);
    plot(X,Y,'o')
    hold on
end

