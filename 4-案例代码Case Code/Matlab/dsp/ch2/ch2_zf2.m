%Zhou Zhiguo
%2019.4.17
%v1.0
%ZF 
clear; 
close all;
clc;

%����ϵͳ
b=[0 1 0.5];
a=[1 -1 0.5];

%���������
figure(1)

theta = linspace(0,2*pi);
r = 0.5*sqrt(2).*ones(1,100);
polarplot(theta,r)
%polarplot(r);
title('$ROC$', 'Interpreter', 'LaTex');

%�������
r_=0.5*sqrt(2)+0.1:0.01:5;
%Ϊ�˱�֤ͼ�ε���ȷ��ʽ��΢��ȡһС����ͼ�Σ�
%����0.5*sqrt(2)��ͼ���Ƿ�ɢ���εģ�
phi_=0:0.01:2*pi;
[r, phi]=meshgrid(r_, phi_);

clear phi_;
z_=r.*exp(phi.*1i);
H=(z_+0.5)./(z_.^2-z_+0.5);
clear z_;

figure(2)
[x,y,z]=pol2cart(phi,r,abs(H));
surf(x,y,z);
shading flat;
%������ƣ��ڷ���Ļ����ϻ��ƣ�
figure(3);
[x,y,z]=pol2cart(phi,r,unwrap(angle(H)));
surf(x,y,z);
shading flat;
%%3Dͼ�εĵ���������Bill McDonald, ��д��surf2stl����