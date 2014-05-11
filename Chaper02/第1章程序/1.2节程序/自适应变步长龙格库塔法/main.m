function main
%
%   ����������
%
if exist('myfun.m')==0
    disp('û��Ϊ���̴�����Ϊmyfun.m�ĺ����ļ�,���������������');
    disp('function z=myfun(x,y)');
    disp('z=y-2*x/y;');
    disp('�������ļ�������work�ļ�����');
end

if exist('self.m')==0
    disp('��work�ļ�����û��self.m�ļ�');
end

eps=10^(-8);
x1=input('�������ʼ��x1=');
y1=input('�������ʼ����y1=');
xn=input('��������ֹ����xn=');
h1=input('�������ʼ����h1=');
h=h1;

fprintf('h=%10.8f,x=%10.8f,y=%10.8f\n',h,x1,y1);   %�����ʼ����

if h>abs(x1-xn)
    disp('��ʼ����ȡ�ù��󣬳������������ĳ���');
    x1 = xn + 1; % ��ֹ����
end

while x1<=xn
    [u2,v2,h,err]=self(x1,y1,h);
    H=h;
    half_err=err;
    double_err=err;
    %��������ʱ��������С����
    while half_err>eps        
        H=h;
        [u2,v2,h,err]=self(x1,y1,H);
        half_err=err;
    end
    %������Сʱ�����Ͻ���������
    while double_err<eps                                  
        H=2*H;
        [u2,v2,h,err]=self(x1,y1,H);
        double_err=err;
    end
    %�����ʣ������е�������
    if double_err>=eps                                   
        H=H/2;
        [u2,v2,h,err]=self(x1,y1,H);
    end
    %����˵���,Ϊ��һ�ڵ�ļ����ṩ��ʼֵ
    fprintf('h=%10.8f,x=%10.8f,y=%10.8f\n',H,u2,v2);      
    x1=u2;                                               
    y1=v2;
    h=h1;
    plot(x1,y1,'o')
    hold on
end