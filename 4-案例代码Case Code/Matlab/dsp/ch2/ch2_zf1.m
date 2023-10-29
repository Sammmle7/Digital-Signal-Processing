%Zhou Zhiguo
%2019.4.17
%v1.0
%ZF 
clear; 
close all;

%����ϵͳ
b=[0 1 0.5];
a=[1 -1 0.5];
%�����㼫��ͼ
subplot(2,2,[1, 2]);
zplane(b, a);
title('$Pole-zero\;plot$', 'Interpreter', 'LaTex');
xlabel('$Real\;part$', 'Interpreter', 'LaTex')
ylabel('$Imaginary\;part$', 'Interpreter', 'LaTex');
%����Ƶ����Ӧ������
[H, w] = freqz(b, a, 1000, 'whole');
subplot(223);
plot(w, abs(H));
axis([0 2*pi 0 5]);
title('$|H(e^{j\omega})|$', 'Interpreter', 'LaTex');
ylabel('$Magnitude$', 'Interpreter', 'LaTex')
xlabel('$\omega$', 'Interpreter', 'LaTex');
subplot(224);
%����Ƶ����Ӧ��λ��
plot(w, unwrap(angle(H)));
title('$\Phi(\omega)_{unwrap}$', 'Interpreter', 'LaTex');
ylabel('$Phase$', 'Interpreter', 'LaTex')
xlabel('$\omega$', 'Interpreter', 'LaTex');
