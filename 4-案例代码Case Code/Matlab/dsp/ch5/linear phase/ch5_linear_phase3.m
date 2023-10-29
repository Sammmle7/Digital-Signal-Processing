% Zhou Zhiguo
% 2019.4.26
% Ch5 �����˲������
% ˵�������б��ʵ��4��������λ���Ⱥ�������λ����

clear; 
close all;
clc;

%--------------------------------------------------------------------------
% (1)
% https://ww2.mathworks.cn/help/dsp/ref/firtype.html?s_tid=doc_ta

% Nָ�����г���
% case1��h(n)����ż�Գƣ�NΪ����
% case2��h(n)����ż�Գƣ�NΪż��
% case3��h(n)������Գƣ�NΪ����
% case4��h(n)������Գƣ�NΪż��

% Nָ���˲����������ȿα����г���С1
% Filter type, returned as either 1, 2, 3, or 4. Filter types are defined as follows:
% Type 1 �� Even-order symmetric coefficients     h(n)ż�Գƣ�Fż���ף�NΪ����
% Type 2 �� Odd-order symmetric coefficients      h(n)ż�Գƣ�F�����ף�NΪż��
% Type 3 �� Even-order antisymmetric coefficients h(n)��Գƣ�Fż���ף�NΪ����
% Type 4 �� Odd-order antisymmetric coefficients  h(n)��Գƣ�F�����ף�NΪż��
%--------------------------------------------------------------------------
figure;
%Type 1 �� Even-order symmetric coefficients <=> case1��h(n)ż�Գƣ�Fż���ף�NΪ����   
subplot(2,1,1)
%h1 = fir1(8,0.5);
h1 = fir1(8,0.3);
impz(h1), title(['Type ' int2str(firtype(h1))])

% Type 2 �� Odd-order symmetric coefficients <=> case2��h(n)ż�Գƣ�F�����ף�NΪż��
subplot(2,1,2)
%h2 = fir1(9,0.5);
h2 = fir1(9,0.3);
impz(h2), title(['Type ' int2str(firtype(h2))])

% Type 3 �� Even-order antisymmetric coefficients <=> case3��h(n)��Գƣ�Fż���ף�NΪ����
figure;
subplot(2,1,1)
h3 = firpm(8,[0.2 0.8],[1 1],'hilbert');
impz(h3), title(['Type ' int2str(firtype(h3))])

% Type 4 �� Odd-order antisymmetric coefficients  <=> case4��h(n)��Գƣ�F�����ף�NΪż��
subplot(2,1,2)
h4 = firpm(9,[0.2 0.8],[1 1],'hilbert');
impz(h4), title(['Type ' int2str(firtype(h4))])

%fvtool(h1);
%fvtool(h2);
%fvtool(h3);
%fvtool(h4);

%--------------------------------------------------------------------------
% (2)˵�������б��ʵ��4��������λ---���Ⱥ���
%--------------------------------------------------------------------------
figure;
x = 0:2*pi/512:(2*pi-2*pi/512);%512��

subplot(2,2,1)
Hw1 = linear_phase_Hw_z(h1);
plot(x,Hw1);
xlabel('Ƶ��');
ylabel('H(w)');
xlim([0 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'})
title('Type 1');
grid on;

subplot(2,2,2)
Hw2 = linear_phase_Hw_z(h2);
plot(x,Hw2);
xlabel('Ƶ��');
ylabel('H(w)');
xlim([0 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'})
title('Type 2');
grid on;

subplot(2,2,3)
Hw3 = linear_phase_Hw_z(h3);
plot(x,Hw3);
xlabel('Ƶ��');
ylabel('H(w)');
xlim([0 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'})
title('Type 3');
grid on;

subplot(2,2,4)
Hw4 = linear_phase_Hw_z(h4);
plot(x,Hw4);
xlabel('Ƶ��');
ylabel('H(w)');
xlim([0 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'})
title('Type 4');
grid on;

%--------------------------------------------------------------------------
% (3)˵�������б��ʵ��4��������λ---��Ƶ��Ӧ
%--------------------------------------------------------------------------
figure;
x = 0:2*pi/512:(2*pi-2*pi/512);%512��

subplot(2,2,1)
Hw1 = linear_phase_Hw_z(h1);
plot(x,abs(Hw1));
xlabel('Ƶ��');
ylabel('|X(e^j^\omega)|');
xlim([0 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'})
title('Type 1');
grid on;

subplot(2,2,2)
Hw2 = linear_phase_Hw_z(h2);
plot(x,abs(Hw2));
xlabel('Ƶ��');
ylabel('|X(e^j^\omega)|');
xlim([0 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'})
title('Type 2');
grid on;

subplot(2,2,3)
Hw3 = linear_phase_Hw_z(h3);
plot(x,abs(Hw3));
xlabel('Ƶ��');
ylabel('|X(e^j^\omega)|');
xlim([0 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'})
title('Type 3');
grid on;

subplot(2,2,4)
Hw4 = linear_phase_Hw_z(h4);
plot(x,abs(Hw4));
xlabel('Ƶ��');
ylabel('|X(e^j^\omega)|');
xlim([0 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'})
title('Type 4');
grid on;

%--------------------------------------------------------------------------
% ��4��˵�������б��ʵ��4��������λ---��λ����
%--------------------------------------------------------------------------
figure;
x = 0:2*pi/512:(2*pi-2*pi/512);%512��

subplot(2,2,1)
Qw1 = linear_phase_Qw_z(h1);
plot(x,Qw1);
xlabel('Ƶ��');
ylabel('Q(w)');
xlim([0 2*pi]);
ylim([-10*pi 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
yticks(-8*pi:2*pi:2*pi);
yticklabels({'-8\pi','-6\pi','-4\pi','-2\pi','0\pi','2\pi'});
title('Type 1');
grid on;

subplot(2,2,2)
Qw2 = linear_phase_Qw_z(h2);
plot(x,Qw2);
xlabel('Ƶ��');
ylabel('Q(w)');
xlim([0 2*pi]);
ylim([-10*pi 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
yticks(-8*pi:2*pi:2*pi);
yticklabels({'-8\pi','-6\pi','-4\pi','-2\pi','0\pi','2\pi'});
title('Type 2');
grid on;

subplot(2,2,3)
Qw3 = linear_phase_Qw_z(h3);
plot(x,Qw3);
xlabel('Ƶ��');
ylabel('Q(w)');
xlim([0 2*pi]);
ylim([-10*pi 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
yticks(-8*pi:2*pi:2*pi);
yticklabels({'-8\pi','-6\pi','-4\pi','-2\pi','0\pi','2\pi'});
title('Type 3');
grid on;

subplot(2,2,4)
Qw4 = linear_phase_Qw_z(h4);
plot(x,Qw4);
xlabel('Ƶ��');
ylabel('Q(w)');
xlim([0 2*pi]);
ylim([-10*pi 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
yticks(-8*pi:2*pi:2*pi);
yticklabels({'-8\pi','-6\pi','-4\pi','-2\pi','0\pi','2\pi'});
title('Type 4');
grid on;

%--------------------------------------------------------------------------
% ��5��˵�������б��ʵ��4��������λ---��Ƶ����Ƶ��Ӧ
%--------------------------------------------------------------------------
% h1
figure;

K=512;
dw=2*pi/K;
k=0:511;
h = h1;
H = fft(h,512);

subplot(3,1,1);
stem(h);
%xlim([0 16]);
%ylim([-2 2]);
xlabel('���к�');
ylabel('����ֵ');
title('����h(n)')

subplot(3,1,2);
plot(k*dw,abs(H));
plot(k*dw,abs(H));
xlim([0 2*pi]);
%ylim([0 10]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��ֵ');
title('��Ƶ��Ӧ|X(e^j^\omega)|');

subplot(3,1,3)
plot(k*dw,angle(H));
xlim([0 2*pi]);
ylim([-pi pi]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��λ');
title('��Ƶ��Ӧ arg{X(e^j^\omega)}')

%--------------------------------------------------------------------------
% h2
figure;

K=512;
dw=2*pi/K;
k=0:511;
h = h2;
H = fft(h,512);

subplot(3,1,1);
stem(h);
%xlim([0 16]);
%ylim([-2 2]);
xlabel('���к�');
ylabel('����ֵ');
title('����h(n)')

subplot(3,1,2);
plot(k*dw,abs(H));
plot(k*dw,abs(H));
xlim([0 2*pi]);
%ylim([0 10]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��ֵ');
title('��Ƶ��Ӧ|X(e^j^\omega)|');

subplot(3,1,3)
plot(k*dw,angle(H));
xlim([0 2*pi]);
ylim([-pi pi]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��λ');
title('��Ƶ��Ӧ arg{X(e^j^\omega)}')

%--------------------------------------------------------------------------
% h3
figure;

K=512;
dw=2*pi/K;
k=0:511;
h = h3;
H = fft(h,512);

subplot(3,1,1);
stem(h);
%xlim([0 16]);
%ylim([-2 2]);
xlabel('���к�');
ylabel('����ֵ');
title('����h(n)')

subplot(3,1,2);
plot(k*dw,abs(H));
plot(k*dw,abs(H));
xlim([0 2*pi]);
%ylim([0 10]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��ֵ');
title('��Ƶ��Ӧ|X(e^j^\omega)|');

subplot(3,1,3)
plot(k*dw,angle(H));
xlim([0 2*pi]);
ylim([-pi pi]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��λ');
title('��Ƶ��Ӧ arg{X(e^j^\omega)}')

%--------------------------------------------------------------------------
% h4
figure;

K=512;
dw=2*pi/K;
k=0:511;
h = h4;
H = fft(h,512);

subplot(3,1,1);
stem(h);
%xlim([0 16]);
%ylim([-2 2]);
xlabel('���к�');
ylabel('����ֵ');
title('����h(n)')

subplot(3,1,2);
plot(k*dw,abs(H));
xlim([0 2*pi]);
%ylim([0 10]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��ֵ');
title('��Ƶ��Ӧ|X(e^j^\omega)|');

subplot(3,1,3)
plot(k*dw,angle(H));
xlim([0 2*pi]);
ylim([-pi pi]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��λ');
title('��Ƶ��Ӧ arg{X(e^j^\omega)}')

