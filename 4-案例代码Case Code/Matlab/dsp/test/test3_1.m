% Zhou Zhiguo
% 2019.5.28
% �����źŴ��� �ο���
% 3-1
% Y =[1 -2  2  -3]
     
clear; 
close all;
clc;

X=[1 2 2 3];
x=ifft(X);
y1=cirshftt(x,2,4);
Y1=fft(y1);

y2 = circshift(x,2);  %ѭ������2��u1=u((n-2));
%y2 = circshift(x,-2); %ѭ������2��v1=u((n+2));
Y2=fft(y2);