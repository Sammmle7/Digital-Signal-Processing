% Zhou Zhiguo
% 2019.4.26
% Ch5 �����˲������
% unwrap ��λƽ�� �������H(w),Q(w)����һ��
% ˵�������б��ʵ��4��������λ���Ⱥ�������λ����
% ����PPT�μ�h(n)

clear; 
close all;
clc;

%--------------------------------------------------------------------------
% (1) https://ww2.mathworks.cn/help/dsp/ref/firtype.html?s_tid=doc_ta
%--------------------------------------------------------------------------
figure;
%Type 1 �� Even-order symmetric coefficients <=> case1��h(n)ż�Գƣ�Fż���ף�NΪ����   
subplot(2,1,1)
%h1 = fir1(8,0.3);
%h1 = [1 2 3 4 3 2 1];
h1 = [0.5 1 -1.5 2 -1.5 1 0.5];
impz(h1), title(['Type ' int2str(firtype(h1))])

% Type 2 �� Odd-order symmetric coefficients <=> case2��h(n)ż�Գƣ�F�����ף�NΪż��
subplot(2,1,2)
%h2 = fir1(9,0.3);
h2 = [0 0.5 1 -1 -1 1 0.5 0];
impz(h2), title(['Type ' int2str(firtype(h2))])

% Type 3 �� Even-order antisymmetric coefficients <=> case3��h(n)��Գƣ�Fż���ף�NΪ����
figure;
subplot(2,1,1)
%h3 = firpm(8,[0.2 0.8],[1 1],'hilbert');
h3 = [0 0.5 1 -1.5 0 1.5 -1 -0.5 0];
impz(h3), title(['Type ' int2str(firtype(h3))])

% Type 4 �� Odd-order antisymmetric coefficients  <=> case4��h(n)��Գƣ�F�����ף�NΪż��
subplot(2,1,2)
%h4 = firpm(9,[0.2 0.8],[1 1],'hilbert');
h4 = [0 0.5 1 -1.5 1.5 -1 -0.5 0];
impz(h4), title(['Type ' int2str(firtype(h4))])

%--------------------------------------------------------------------------
% ��5��˵�������б��ʵ��4��������λ---��Ƶ����Ƶ��Ӧ
%--------------------------------------------------------------------------
% h1
figure;

K=512;
dw=2*pi/K;
k=0:(K-1);
h = h1;
H = fft(h,K);

subplot(4,1,1);
stem(h);
%xlim([0 16]);
%ylim([-2 2]);
xlabel('���к�');
ylabel('����ֵ');
title('����h(n)')

subplot(4,1,2);
plot(k*dw,abs(H));
plot(k*dw,abs(H));
xlim([0 2*pi]);
%ylim([0 10]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��ֵ');
title('��Ƶ��Ӧ|X(e^j^\omega)|');

subplot(4,1,3)
plot(k*dw,angle(H));
xlim([0 2*pi]);
ylim([-pi pi]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��λ');
title('��Ƶ��Ӧ arg{X(e^j^\omega)}')

subplot(4,1,4)
H_unwrap = unwrap(angle(H));
plot(k*dw,H_unwrap);
%plot(k*dw,angle(H));
xlim([0 2*pi]);
%ylim([-pi pi]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��λ');
title('��Ƶ��Ӧ arg{X(e^j^\omega)}---ƽ��')
%--------------------------------------------------------------------------
% h2
figure;

K=512;
dw=2*pi/K;
k=0:(K-1);
h = h2;
H = fft(h,K);

subplot(4,1,1);
stem(h);
%xlim([0 16]);
%ylim([-2 2]);
xlabel('���к�');
ylabel('����ֵ');
title('����h(n)')

subplot(4,1,2);
plot(k*dw,abs(H));
plot(k*dw,abs(H));
xlim([0 2*pi]);
%ylim([0 10]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��ֵ');
title('��Ƶ��Ӧ|X(e^j^\omega)|');

subplot(4,1,3)
plot(k*dw,angle(H));
xlim([0 2*pi]);
ylim([-pi pi]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��λ');
title('��Ƶ��Ӧ arg{X(e^j^\omega)}')

subplot(4,1,4)
H_unwrap = unwrap(angle(H));
plot(k*dw,H_unwrap);
%plot(k*dw,angle(H));
xlim([0 2*pi]);
%ylim([-pi pi]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��λ');
title('��Ƶ��Ӧ arg{X(e^j^\omega)}---ƽ��')
%--------------------------------------------------------------------------
% h3
figure;

K=512;
dw=2*pi/K;
k=0:(K-1);
h = h3;
H = fft(h,K);

subplot(4,1,1);
stem(h);
%xlim([0 16]);
%ylim([-2 2]);
xlabel('���к�');
ylabel('����ֵ');
title('����h(n)')

subplot(4,1,2);
plot(k*dw,abs(H));
plot(k*dw,abs(H));
xlim([0 2*pi]);
%ylim([0 10]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��ֵ');
title('��Ƶ��Ӧ|X(e^j^\omega)|');

subplot(4,1,3)
plot(k*dw,angle(H));
xlim([0 2*pi]);
ylim([-pi pi]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��λ');
title('��Ƶ��Ӧ arg{X(e^j^\omega)}')

subplot(4,1,4)
H_unwrap = unwrap(angle(H));
plot(k*dw,H_unwrap);
%plot(k*dw,angle(H));
xlim([0 2*pi]);
%ylim([-pi pi]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��λ');
title('��Ƶ��Ӧ arg{X(e^j^\omega)}---ƽ��')
%--------------------------------------------------------------------------
% h4
figure;

K=512;
dw=2*pi/K;
k=0:(K-1);
h = h4;
H = fft(h,K);

subplot(4,1,1);
stem(h);
%xlim([0 16]);
%ylim([-2 2]);
xlabel('���к�');
ylabel('����ֵ');
title('����h(n)')

subplot(4,1,2);
plot(k*dw,abs(H));
xlim([0 2*pi]);
%ylim([0 10]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��ֵ');
title('��Ƶ��Ӧ|X(e^j^\omega)|');

subplot(4,1,3)
plot(k*dw,angle(H));
xlim([0 2*pi]);
ylim([-pi pi]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��λ');
title('��Ƶ��Ӧ arg{X(e^j^\omega)}')

subplot(4,1,4)
H_unwrap = unwrap(angle(H));
plot(k*dw,H_unwrap);
%plot(k*dw,angle(H));
xlim([0 2*pi]);
%ylim([-pi pi]);
xlabel('����Ƶ�� 0~2\pi');
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
ylabel('��λ');
title('��Ƶ��Ӧ arg{X(e^j^\omega)}---ƽ��')
