% Zhou Zhiguo
% 2019.8.6
% Ch5 �����˲������
% Chebyshev Type I filter �˲���������ԶԽ���N��������ϵ

clear; 
close all;
clc;

figure;
N = 6;
str = ["N=1","N=2","N=3","N=4","N=5","N=6"];
for n = 1:N
    [z,p,k] = cheb1ap(n,3);       % Lowpass filter prototype
    [num,den] = zp2tf(z,p,k);     % Convert to transfer function form

    w = linspace(0, pi);        
    h = freqs(num,den,w);
    
    %ע��NΪż��ʱ��h(0)С��1
    if n == 1
    max_h = h(1);
    end
    mag = abs(h)/abs(max_h);
    
    dbmag = 20*log10(mag);
    phase = angle(h);           %���scale:-pi~pi
    degphase = phase*180/pi;    %תΪdegree

    plot(w/pi,mag)
    xlabel('Ƶ��');
    ylabel('���');
    title('�б�ѩ��-I �˲���������ԶԽ���N��������ϵ')
    grid on;
    hold on;
    
end
legend(str(1),str(2),str(3),str(4),str(5),str(6));
