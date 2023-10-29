%Zhou Zhiguo
%2019.5.2
%v1.0
% butter & Chebyshev ~ N
% butter^2 & Chebyshev^2 ~ N
clear; 
close all;
clc;

%-----------------------------------
% butter & Chebyshev ~ N
figure(1);
n = 4;    %4��
str = ["N=4 ������˹", "N=4 �б�ѩ��-I"];
%-----------------------------------
%������˹
[z, p, k]=buttap(n);
[num,den] = zp2tf(z,p,k);
w = linspace(0, pi);        
h = freqs(num,den,w);
mag = abs(h)/abs(h(1));
dbmag = 20*log10(mag);
phase = angle(h);           %���scale:-pi~pi
degphase = phase*180/pi;    %תΪdegree
plot(w/pi,mag)
hold on;   
%-----------------------------------
%�б�ѩ��-I  ע��I�ͷ���ż
Rp = 1; %3db ������

n = 1;
[z,p,k] = cheb1ap(n,Rp);       % Lowpass filter prototype
[num,den] = zp2tf(z,p,k);     % Convert to transfer function form
w = linspace(0, pi);        
h = freqs(num,den,w);
max_h = h(1);

n = 3;
[z,p,k] = cheb1ap(n,Rp);       % Lowpass filter prototype
[num,den] = zp2tf(z,p,k);     % Convert to transfer function form
w = linspace(0, pi);        
h = freqs(num,den,w);
mag = abs(h)/abs(max_h);
dbmag = 20*log10(mag);
phase = angle(h);           %���scale:-pi~pi
degphase = phase*180/pi;    %תΪdegree
plot(w/pi,mag)

%-----------------------------------
xlabel('Ƶ��');
ylabel('���');
title('������˹/�б�ѩ��-I �˲���������ԶԽ״�N��������ϵ')
grid on;
legend(str(1),str(2));
%-----------------------------------

%-----------------------------------
% butter^2 & Chebyshev^2 ~ N
figure(2);
n = 4;    %4��
str = ["N=4 ������˹", "N=4 �б�ѩ��-II"];
%-----------------------------------
%������˹^2
[z, p, k]=buttap(n);
[num,den] = zp2tf(z,p,k);
w = linspace(0, pi);        
h = freqs(num,den,w);
mag = abs(h)/abs(h(1));
mag_s = power(mag,2);
dbmag = 20*log10(mag_s);
phase = angle(h);           %���scale:-pi~pi
degphase = phase*180/pi;    %תΪdegree
plot(w/pi,mag_s)
hold on;   
%-----------------------------------
%�б�ѩ��^2  ע��I�ͷ���ż
n = 1;
[z,p,k] = cheb1ap(n,Rp);       % Lowpass filter prototype
[num,den] = zp2tf(z,p,k);     % Convert to transfer function form
w = linspace(0, pi);        
h = freqs(num,den,w);
max_h = h(1);

n = 3;
[z,p,k] = cheb1ap(n,Rp);       % Lowpass filter prototype
[num,den] = zp2tf(z,p,k);     % Convert to transfer function form
w = linspace(0, pi);        
h = freqs(num,den,w);
mag = abs(h)/abs(max_h);
mag_s = power(mag,2);
dbmag = 20*log10(mag_s);
phase = angle(h);           %���scale:-pi~pi
degphase = phase*180/pi;    %תΪdegree
plot(w/pi,mag_s)

%-----------------------------------
xlabel('Ƶ��');
ylabel('���');
title('������˹/�б�ѩ��-II �˲������ƽ�����ԶԽ״�N��������ϵ')
grid on;
legend(str(1),str(2));
%-----------------------------------