function main
%
%  ����������
%
% �жϲ��Է��̴������
if exist('myfun.m')==0
    disp('û��Ϊ���̴�����Ϊmyfun.m�ĺ����ļ�,���������������');
    disp('function z=myfun(x,y)');
    disp('z=y-2*x/y;');
    disp('�������ļ�������work�ļ�����');
end

X1=input('����������������˵�X1=');
Y1=input('������΢�ַ��̵ĳ�ʼ����Y1=��X=X1ʱY��ֵ��');
Xn=input('���������������Ҷ˵�Xn=');
h=input('��������ⲽ��h=');

X=X1;
Y=Y1;        %�����ʼ��
n=0;         %�ڵ���ű�������

while X<=Xn-h
    K1=myfun(X,Y);
    K2=myfun(X+h/2,Y+K1*h/2);
    K3=myfun(X+h/2,Y+K2*h/2);
    K4=myfun(X+h,Y+K3*h);
    X=X+h;
    Y=Y+h*(K1+2*K2+2*K3+K4)/6;      %�Ľױ�׼������-������ʽ
    n=n+1;                          %�ڵ���ż�1
    
    fprintf('��%d����ļ�����ΪX=%10.8f,Y=%10.8f\n',n,X,Y);
    plot(X,Y,'o')
    hold on
end

