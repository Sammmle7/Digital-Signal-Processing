% Zhou Zhiguo
% 2019.5.1
% Ch5 �����˲������
% ������Ӧ����任��---impinvar 

% ˵���������ϸ˼· -- ���Ͱ�

clear; 
close all;
clc;

%--------------------------------------------------------------------------
% P194 ��ѧdemo
% ����������Ӧ����任����������ְ�����˹�˲���
% ͨ�� Wp = 0.2*pi     1dB
% ��� Ws = 0.3~1*pi   15dB
% ��N,H(z),H(ejw),ֱ��-I
%--------------------------------------------------------------------------
T = 1;
fs = 1;
Wp = 0.2*pi; 
Ws = 0.3*pi;
Ap = 1;     %dB
As = 15;    %dB

%--------------------------------------------------------------------------
%ģ��ԭ���˲���������freqs�Զ����Ʒ�Ƶ����Ƶͼ
%--------------------------------------------------------------------------
%[n,Wn] = buttord(Wp,Ws,Rp,Rs,'s') finds the minimum order n and cutoff frequencies Wn for an analog Butterworth filter. 
%Specify the frequencies Wp and Ws in radians per second. The passband or the stopband can be infinite.

[N,Wc] = buttord(Wp,Ws,Ap,As,'s'); %������СN��Wc����������Wc = 0.7087

%�����������Wc = 0.7087 �������Ҫ�󣬸�ͨ����ԣ��
%�α���������Wc = 0.7032 ����ͨ��Ҫ�󣬸������ԣ��

[z,p,k] = buttap(N);          % Butterworth filter prototype
%p = 
%    -0.2588 + 0.9659i
%    -0.2588 - 0.9659i
%    -0.7071 + 0.7071i
%    -0.7071 - 0.7071i
%    -0.9659 + 0.2588i
%    -0.9659 - 0.2588i
%k = 1

%�����������H(s)=1/[s-(-0.2588 + 0.9659i)][s-(-0.2588 - 0.9659i)][s-(-0.7071 + 0.7071i)][s-(-0.7071 - 0.7071i)][s-(-0.9659 + 0.2588i)][s-(-0.9659 - 0.2588i)]
%------------>H(s)=1/(s^2 + 0.5176s + 1)(s^2 + 1.414s + 1)(s^2 + 1.9318s + 1)
%------------>H(s)=1/(s^6 + 3.8634*s^5 + 7.4634*s^4 + 9.1407*s^3 + 7.4634*s^2 + 3.8634*s + 1)
%�����þ������ a=[1 0.5176 1]; b=[1 1.414 1]; c=[1 1.9318 1]
%hh=conv(a,b);hhh=conv(hh,c);
%hhh = 1.0000    3.8634    7.4634    9.1407    7.4634    3.8634    1.0000

%�α���������H(s)=0.12093/(s^2 + 0.3640s + 0.4945)(s^2 + 0.9945s + 0.4945)(s^2 + 1.3585s + 0.4945)
%�α���������H(s)=0.12093/(s^6 + 2.7170*s^5 + 3.6910*s^4 + 3.1789*s^3 + 1.8252*s^2 + 0.6644*s + 0.1209)
%�þ������a=[1 0.3640 0.4945];b=[1 0.9945 0.4945];c=[1 1.3585 0.4945]
%hh=conv(a,b);hhh=conv(hh,c);
%hhh = 1.0000    2.7170    3.6910    3.1789    1.8252    0.6644    0.1209
%
%Wn^1 = 0.7032^1 = 0.7032
%Wn^2 = 0.7032^2 = 0.4945
%Wn^3 = 0.7032^3 = 0.3477
%Wn^4 = 0.7032^4 = 0.2445
%Wn^5 = 0.7032^5 = 0.1719
%Wn^6 = 0.7032^6 = 0.1209
%
%��5-1��������
%��5-1��������H(s)=Wn^6/(s^6 + 3.863*Wn*s^5 + 7.464*Wn^2*s^4 + 9.141*Wn^3*s^3 + 7.464*Wn^4*s^2 + 3.863*Wn^5*s + Wn^6)
%��5-1��������H(s)=0.1209/(s^6 + 2.7165*s^5 + 3.6909*s^4 + 3.1786*s^3 + 1.8251*s^2 + 0.6642*s + 0.1209)
%���ۣ��α������� = ��5-1 

%�α��������� H(s)=0.12093/(s^6 + 2.7170*s^5 + 3.6910*s^4 + 3.1789*s^3 + 1.8252*s^2 + 0.6644*s + 0.1209)
%����������� H(s)=1/(s^6 + 3.8634*s^5 + 7.4634*s^4 + 9.1407*s^3 + 7.4634*s^2 + 3.8634*s + 1)
%��5-1��������H(s)=Wn^6/(s^6 + 3.863*Wn*s^5 + 7.464*Wn^2*s^4 + 9.141*Wn^3*s^3 + 7.464*Wn^4*s^2 + 3.863*Wn^5*s + Wn^6)
%��5-1��������H(s)=0.1209/(s^6 + 2.7165*s^5 + 3.6909*s^4 + 3.1786*s^3 + 1.8251*s^2 + 0.6642*s + 0.1209)
%���ۣ������������Wn��һ���ˣ�����

c_normalized = 0;
if c_normalized == 1
[num,den] = zp2tf(z,p,k);     % Convert to transfer function form
%num = 0         0         0         0         0         0         1
%den = 1.0000    3.8637    7.4641    9.1416    7.4641    3.8637    1.0000
else
%���˾��飺
% [N,Wc] = buttord(Wp,Ws,Ap,As,'s');���N��Wc�����Wc����һ����
% [z,p,k] = buttap(N);              ����㼫�㣬������㼫���ǹ�һ���ģ� 
% [num,den] = zp2tf(z,p,k);         ����ӣ���ĸϵ��ǰ���㼫����Ҫȥ��һ����
p = p*Wc;  %�α�������ֵ
[num,den] = zp2tf(z,p,k);     % Convert to transfer function form
num = num*(Wc^N);
%num = 0         0         0         0         0         0         0.1266
%den = 1.0000    2.7380    3.7484    3.2533    1.8824    0.6905    0.1266
end

figure(1);
W = logspace(-pi,pi);
freqs(num,den,W)                % Frequency response of analog filter

%--------------------------------------------------------------------------
%ģ��ԭ���˲�����������freqs���h,w�����ϻ��Ʒ�Ƶ����Ƶͼ
%--------------------------------------------------------------------------
figure(2);
%w = logspace(-1, 1);       %scale:log 
w = logspace(-pi, pi);       %scale:log 
h = freqs(num,den,w);
mag = abs(h)/abs(h(1));
dbmag = 20*log10(mag);
phase = angle(h);           %���scale:-pi~pi
degphase = phase*180/pi;    %תΪdegree
subplot(2,1,1), loglog(w,mag)
grid on;
xlabel('Frequency (rad/s)');
ylabel('Magnitude');
title('Ƶ��-����');
subplot(2,1,2), semilogx(w,degphase)
grid on;
xlabel('Frequency (rad/s)');
ylabel('Phase (degrees)');
title('Ƶ��-��λ');

%--------------------------------------------------------------------------
%ģ��ԭ���˲�������Ƶ ����---���� �Ƚ�ͼ
%--------------------------------------------------------------------------
figure(3);
subplot(2,1,1), loglog(w,mag)
grid on;
xlabel('Frequency (rad/s)');
ylabel('Magnitude');
title('Ƶ��-����');
subplot(2,1,2),  semilogx(w,dbmag)
grid on;
xlabel('Frequency (rad/s)');
ylabel('Magnitude ��dB��');
title('Ƶ��-���� dB');

%--------------------------------------------------------------------------
%ģ���˲������
%��P196 ͼ5-41ָ��һ�£���ͼ5-41�������˲���
%--------------------------------------------------------------------------
figure(4);
w = linspace(0, pi);        
h = freqs(num,den,w);
mag = abs(h)/abs(h(1));
dbmag = 20*log10(mag);
phase = angle(h);           %���scale:-pi~pi
degphase = phase*180/pi;    %תΪdegree

subplot(3,1,1), plot(w/pi,mag)
grid on;
xlabel('Frequency (0~\pi)');
xticklabels({'0','0.1\pi','0.2\pi','0.3\pi','0.4\pi','0.5\pi','0.6\pi','0.7\pi','0.8\pi','0.9\pi','\pi'})
ylabel('Magnitude');
title('ģ���˲��� Ƶ��-����');
subplot(3,1,2), plot(w/pi,dbmag)
grid on;
xlabel('Frequency (0~\pi)');
xticklabels({'0','0.1\pi','0.2\pi','0.3\pi','0.4\pi','0.5\pi','0.6\pi','0.7\pi','0.8\pi','0.9\pi','\pi'})
ylabel('Magnitude ��dB��');
title('ģ���˲��� Ƶ��-���� dB');
subplot(3,1,3), plot(w/pi,degphase)
grid on;
xlabel('Frequency (0~\pi)');
xticklabels({'0','0.1\pi','0.2\pi','0.3\pi','0.4\pi','0.5\pi','0.6\pi','0.7\pi','0.8\pi','0.9\pi','\pi'})
ylabel('Phase (degrees)');
title('ģ���˲��� Ƶ��-��λ');

%--------------------------------------------------------------------------
%��������˲���
%����freqz�Զ����Ʒ�Ƶ����Ƶͼ
%--------------------------------------------------------------------------
figure(5);
[b,a] = butter(N,Wc/pi);  
%���ģ���˲�����
%[___] = butter(___,'s') designs a lowpass, highpass, bandpass, or bandstop analog Butterworth filter with cutoff angular frequency Wn.

%B =      0         0         0         0         0         0    0.1266
%A = 1.0000    2.7380    3.7484    3.2533    1.8824    0.6905    0.1266

freqz(b,a);

%--------------------------------------------------------------------------
%������freqz���h,�����ϻ��Ʒ�Ƶ����Ƶͼ
%--------------------------------------------------------------------------
figure(8);
w = linspace(0,pi);       %scale:log 
h = freqz(b,a,w);
mag = abs(h)/abs(h(1));
dbmag = 20*log10(mag);
phase = angle(h);           %���scale:-pi~pi
degphase = phase*180/pi;    %תΪdegree

subplot(3,1,1), plot(w,mag)
grid on;
xlabel('Frequency (rad/s)');
xlim([0 pi]);
xticks(0:0.1*pi:pi);
xticklabels({'0','0.1\pi','0.2\pi','0.3\pi','0.4\pi','0.5\pi','0.6\pi','0.7\pi','0.8\pi','0.9\pi','\pi'})
ylabel('Magnitude');
title('Ƶ��-����');

subplot(3,1,2), plot(w,dbmag)
grid on;
xlabel('Frequency (0~\pi)');
xlim([0 pi]);
xticks(0:0.1*pi:pi);
xticklabels({'0','0.1\pi','0.2\pi','0.3\pi','0.4\pi','0.5\pi','0.6\pi','0.7\pi','0.8\pi','0.9\pi','\pi'})
ylabel('Magnitude ��dB��');
ylim([-80 0]);
title('�����˲��� Ƶ��-���� dB');

subplot(3,1,3), plot(w,degphase)
grid on;
xlabel('Frequency (rad/s)');
xlim([0 pi]);
xticks(0:0.1*pi:pi);
xticklabels({'0','0.1\pi','0.2\pi','0.3\pi','0.4\pi','0.5\pi','0.6\pi','0.7\pi','0.8\pi','0.9\pi','\pi'})
ylabel('Phase (degrees)');
title('Ƶ��-��λ');

%--------------------------------------------------------------------------
%��������˲���
%����������Ӧ����任�����
%����freqz�Զ����Ʒ�Ƶ����Ƶͼ
%--------------------------------------------------------------------------
figure(6);
[B,A] = butter(N,Wc,'s');
%��������ģ���˲�����
%[___] = butter(___,'s') designs a lowpass, highpass, bandpass, or bandstop analog Butterworth filter with cutoff angular frequency Wn.
%B =      0         0         0         0         0         0    0.1266
%A = 1.0000    2.7380    3.7484    3.2533    1.8824    0.6905    0.1266

[D,C] = impinvar(B,A,fs); 

%[bz,az] = impinvar(b,a,fs) creates a digital filter with numerator and denominator coefficients bz and az, respectively, 
%whose impulse response is equal to the impulse response of the analog filter with coefficients b and a, scaled by 1/fs. 
%If you leave out the argument fs, or specify fs as the empty vector [], it takes the default value of 1 Hz.

%D = -0.0000    0.0007    0.0105    0.0167    0.0042    0.0001         0
%C = 1.0000   -3.3443    5.0183   -4.2190    2.0725   -0.5600    0.0647


freqz(D,C,1024,fs);

%B = 0         0         0         0         0         0         0.1266
%A = 1.0000    2.7380    3.7484    3.2533    1.8824    0.6905    0.1266

%num = 0         0         0         0         0         0         0.1266
%den = 1.0000    2.7380    3.7484    3.2533    1.8824    0.6905    0.1266

%--------------------------------------------------------------------------
%��P196 ͼ5-41һ���������˲���
%--------------------------------------------------------------------------
figure(7);
W = linspace(0,pi);       
H = freqz(D,C,W);
mag = abs(H)/abs(H(1));
dbmag = 20*log10(mag);
phase = angle(H);           %���scale:-pi~pi
degphase = phase*180/pi;    %תΪdegree

subplot(3,1,1), plot(W,abs(H))
grid on;
xlabel('Frequency (0~\pi)');
xlim([0 pi]);
xticks(0:0.1*pi:pi);
xticklabels({'0','0.1\pi','0.2\pi','0.3\pi','0.4\pi','0.5\pi','0.6\pi','0.7\pi','0.8\pi','0.9\pi','\pi'})
ylabel('Magnitude');
title('�����˲��� Ƶ��-����');

subplot(3,1,2), plot(W,dbmag)
grid on;
xlabel('Frequency (0~\pi)');
xlim([0 pi]);
xticks(0:0.1*pi:pi);
xticklabels({'0','0.1\pi','0.2\pi','0.3\pi','0.4\pi','0.5\pi','0.6\pi','0.7\pi','0.8\pi','0.9\pi','\pi'})
ylabel('Magnitude ��dB��');
title('�����˲��� Ƶ��-���� dB');

subplot(3,1,3), plot(W,degphase)
grid on;
xlabel('Frequency (0~\pi)');
xlim([0 pi]);
xticks(0:0.1*pi:pi);
xticklabels({'0','0.1\pi','0.2\pi','0.3\pi','0.4\pi','0.5\pi','0.6\pi','0.7\pi','0.8\pi','0.9\pi','\pi'})
ylabel('Phase (degrees)');
title('�����˲��� Ƶ��-��λ');