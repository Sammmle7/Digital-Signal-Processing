% Zhou Zhiguo
% 2019.5.28
% �����źŴ��� �ο���
% 3-3

clear; 
close all;
clc;

X=[1 2 2 3];
x=ifft(X);
y=cirshftt(x,2,4);
Y=fft(y);

