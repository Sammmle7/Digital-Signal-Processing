% Zhou Zhiguo
% 2019.5.5
% ch5_fir_window1
% Window-based FIR filter design ��������
% PPT ���� 

clear; 
close all;
clc;

%--------------------------------------------------------------------------
% (1) FIR Lowpass filter
% Design a 20th-order FIR Lowpass filter with passband 0�ܦء�0.5�� rad/sample.
% Visualize its magnitude and phase responses.
%--------------------------------------------------------------------------
% rectwin
figure;
ord = 20;
b = fir1(ord,0.5,'low',rectwin(ord+1));
h1 = b;
freqz(b,1,512);
grid on;
title('rectwin');
fvtool(b,1);
Hz = filt(b,1);

%--------------------------------------------------------------------------
% ˵�������б��ʵ��4��������λ---���Ⱥ���
%--------------------------------------------------------------------------
figure;
x = 0:2*pi/512:(2*pi-2*pi/512);%512��
subplot(2,1,1)
Hw1 = linear_phase_Hw_z(h1);
plot(x,Hw1);
xlabel('Ƶ��');
ylabel('H(w)');
xlim([0 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'})
title('Type 1');
grid on;

%--------------------------------------------------------------------------
% ˵�������б��ʵ��4��������λ---��λ����
%--------------------------------------------------------------------------
subplot(2,1,2)
Qw1 = linear_phase_Qw_z(h1);
plot(x,Qw1);
xlabel('Ƶ��');
ylabel('Q(w)');
xlim([0 2*pi]);
ylim([-22*pi 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'});
yticks(-22*pi:4*pi:2*pi);
yticklabels({'-22\pi','-18\pi','-14\pi','-10\pi','-6\pi','-2\pi','0\pi','2\pi'});
title('Type 1');
grid on;

%--------------------------------------------------------------------------
% (2) FIR Highpass filter
% Design a 10th-order FIR Highpass filter with passband 0.5�Сܦ� rad/sample.
% Visualize its magnitude and phase responses.
%--------------------------------------------------------------------------
% rectwin
figure;
ord = 10;
b = fir1(ord,0.5,'High',rectwin(ord+1));
h2 = b;
freqz(b,1,512);
grid on;
title('rectwin');
fvtool(b,1);
Hz = filt(b,1);

%--------------------------------------------------------------------------
% ˵�������б��ʵ��4��������λ---���Ⱥ���
%--------------------------------------------------------------------------
figure;
x = 0:2*pi/512:(2*pi-2*pi/512);%512��
subplot(2,1,1)
Hw1 = linear_phase_Hw_z(h2);
plot(x,Hw1);
xlabel('Ƶ��');
ylabel('H(w)');
xlim([0 2*pi]);
xticks(0:0.5*pi:2*pi);
xticklabels({'0','0.5\pi','\pi','1.5\pi','2\pi'})
title('Type 1');
grid on;

%--------------------------------------------------------------------------
% ˵�������б��ʵ��4��������λ---��λ����
%--------------------------------------------------------------------------
subplot(2,1,2)
Qw1 = linear_phase_Qw_z(h2);
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