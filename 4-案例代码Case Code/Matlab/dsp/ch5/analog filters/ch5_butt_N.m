% Zhou Zhiguo
% 2019.4.24
% Ch5 �����˲������
% ������˹ģ���˲��� ���������Խ���N��������ϵ
% �α�P178 ͼ2-23

clear; 
close all;
clc;

%--------------------------------------------------------------------------
%�������򣬷��Ȱ�dB��������ʾ
%--------------------------------------------------------------------------
figure(1);
N = 6;
for n = 1:N
    [z, p, k]=buttap(n);
    [num,den] = zp2tf(z,p,k);
    W = logspace(-1,1);
    freqs(num,den,W)                % Frequency response of analog filter
    hold on;
    
    hs = tf(num,den);
    
    %�α� P179 ��5-1������һ��Wc
    %��ӡ�����ʾ����
    disp(n);
    %��ӡ�����ʾ����
    disp(num);
    %��ӡ�����ʾ��ĸ
    disp(den);
    %��ӡ�����ʾϵͳ����
    hs;
    
    
end

%--------------------------------------------------------------------------
%�ڹ�����������ϣ����Ȱ����ԣ�������ʾ
%--------------------------------------------------------------------------
figure(2);
N = 6;
str = ["N=1","N=2","N=3","N=4","N=5","N=6"];
for n = 1:N
    [z, p, k]=buttap(n);
    [num,den] = zp2tf(z,p,k);
    w = linspace(0, pi);        
    h = freqs(num,den,w);
    mag = abs(h)/abs(h(1));
    dbmag = 20*log10(mag);
    phase = angle(h);           %���scale:-pi~pi
    degphase = phase*180/pi;    %תΪdegree

    subplot(3,1,1), plot(w/pi,mag)
    xlabel('Ƶ��');
    ylabel('���');
    title('������˹�˲���������ԶԽ���N��������ϵ')
    grid on;
    hold on;
    
    subplot(3,1,2), plot(w/pi,dbmag)
    xlabel('Ƶ��');
    ylabel('��� dB');
    title('������˹�˲���������ԶԽ���N��������ϵ')
    grid on;
    hold on;
    
    subplot(3,1,3), plot(w/pi,degphase)
    xlabel('Ƶ��');
    ylabel('��λ');
    title('������˹�˲�����λ���ԶԽ���N��������ϵ')
    grid on;
    hold on;
end
legend(str(1),str(2),str(3),str(4),str(5),str(6));

%--------------------------------------------------------------------------
%�����ѷ����ó�����ʾ
%--------------------------------------------------------------------------
figure(3);
N = 6;
str = ["N=1","N=2","N=3","N=4","N=5","N=6"];
for n = 1:N
    [z, p, k]=buttap(n);
    [num,den] = zp2tf(z,p,k);
    w = linspace(0, pi);        
    h = freqs(num,den,w);
    mag = abs(h)/abs(h(1));
    dbmag = 20*log10(mag);
    phase = angle(h);           %���scale:-pi~pi
    degphase = phase*180/pi;    %תΪdegree

    plot(w/pi,mag)
    xlabel('Ƶ��');
    ylabel('���');
    title('������˹�˲���������ԶԽ���N��������ϵ')
    grid on;
    hold on;   
end
legend(str(1),str(2),str(3),str(4),str(5),str(6));

