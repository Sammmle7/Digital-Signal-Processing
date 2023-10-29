%Zhou Zhiguo
%2019.4.21
%v1.0
%Բ����λ
clear; 
close all;
clc;

% �μ�
u = [0 1 2 1 0];
v = [0 1 0 1 0];
Lconv = conv(u,v);

u1 = circshift(u,2);  %ѭ������2��u1=u((n-2));
v1 = circshift(u,-2); %ѭ������2��v1=u((n+2));

u2 = circshift(flip(u),1);  %���з�ת��ѭ������1��u2=u(-n);
x = circshift(u2,2);        %ѭ������2��x=u((-n+2))=u(-(n-2));

%չʾ
subplot(5,1,1);
stem(u);
xlabel('���');
ylabel('u(n)');
grid on;

subplot(5,1,2);
stem(v);
xlabel('���');
ylabel('v(n)');
grid on;

subplot(5,1,3);
stem(u1);
xlabel('���');
ylabel('u1');
grid on;

subplot(5,1,4);
stem(u2);
xlabel('���');
ylabel('u2');
grid on;

subplot(5,1,5);
stem(x);
xlabel('���');
ylabel('x');
grid on;