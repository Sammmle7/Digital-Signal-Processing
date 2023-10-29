% Zhou Zhiguo
% 2019.5.5
% ch5_filter
% ˵��������filter�����������˲�����

clear; 
close all;
clc;
%--------------------------------------------------------------------------
% https://ww2.mathworks.cn/help/matlab/ref/filter.html
%--------------------------------------------------------------------------
% demo1
% ����һ������������������ɵ� 1��100 �����������е��������߱�����������𻵡�
figure(1);
t = linspace(-pi,pi,100);
rng default  %initialize random number generator
x = sin(t) + 0.25*rand(size(t));

% �ƶ�ƽ��ֵ�˲����������ƶ�����Ϊ  �Ĵ��ڣ�������ÿ�������а��������ݵ�ƽ��ֵ��
% ���²�ַ��̶�������  ���ƶ�ƽ��ֵ�˲�����
% y(n)=[x(n) + x(n-1) + x(n-2) + x(n-3) + x(n-(windowSize-1))]/windowSize
% ���ڴ�СΪ 5 ʱ�����������ݺ����ķ��Ӻͷ�ĸϵ����
windowSize = 5; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;

% �����ݵ��ƶ�ƽ��ֵ�����������ԭʼ���ݵ�ͼ��
y = filter(b,a,x);

plot(t,x);
hold on;
plot(t,y);
legend('Input Data','Filtered Data');
grid on;

% ���⣿ �˲����Ǿ�������������y2��104��y��100����ô����
%h = [0.2 0.2 0.2 0.2 0.2];
%y2 = conv(x,h);
%--------------------------------------------------------------------------
% demo1
% ��ʾ��ʹ�����������ݺ��������ݵľ�������˲���
% H(z)=1/(1-0.2z^-1)

figure(2);

%����һ�����������������ɵ� 2��15 ����
rng default  %initialize random number generator
x = rand(2,15);

%���������ݺ����ķ��Ӻͷ�ĸϵ����
b = 1;
a = [1 -0.2];

%���� x �ĵڶ�ά��Ӧ�ô��ݺ���������ÿ�е�һά�����˲����������ԭʼ���ݵĵ�һ�ж����˲����ݵ�ͼ��
y = filter(b,a,x,[],2);

t = 0:length(x)-1;  %index vector

plot(t,x(1,:))
hold on
plot(t,y(1,:))
legend('Input Data','Filtered Data')
title('First Row')

%�����������ݵĵڶ��ж����˲����ݵ�ͼ��
figure(3);
plot(t,x(2,:))
hold on
plot(t,y(2,:))
legend('Input Data','Filtered Data')
title('Second Row')



