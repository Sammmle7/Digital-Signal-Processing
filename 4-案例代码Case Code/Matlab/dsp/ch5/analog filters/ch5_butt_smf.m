% Zhou Zhiguo
% 2019.8.6
% Ch5 �����˲������

% ������˹ģ���˲�������ƽ������ ����λ��
% Butterworth squared magnitude response function
% �α�P178 ͼ5-24

clear; 
close all;
clc;

figure;
alpha = 0:0.01:2*pi;
x = cos(alpha);
y = sin(alpha);
plot(x,y,'--b');
hold on;

sys = tf([1],[-1 0 0 0 0 0 1]);
% sys = 
%     -1
%  -------
%  s^6 - 1
h = pzplot(sys,'r');

xlim([-1.2 1.2]);
ylim([-1.2 1.2]);
legend("N=3");