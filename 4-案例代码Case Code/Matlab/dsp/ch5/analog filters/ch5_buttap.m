% Zhou Zhiguo
% 2019.8.6
% Ch5 �����˲������
% buttap ������˹ģ��ԭ���˲�������һ����
% ˵�����ͱ�5-1��Ӧ

clear; 
close all;
clc;

%--------------------------------------------------------------------------
% https://ww2.mathworks.cn/help/signal/ref/buttap.html
%--------------------------------------------------------------------------
n = 6;
[z,p,k] = buttap(n);          % Butterworth filter prototype
[num,den] = zp2tf(z,p,k);     % Convert to transfer function form
freqs(num,den)                % Frequency response of analog filter

%n = 3;
%z = [];
%p = exp(sqrt(-1)*(pi*(1:2:2*n-1)/(2*n)+pi/2)).';
%k = real(prod(-p));