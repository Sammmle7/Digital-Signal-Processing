clear; 
close all;

Fs=2; %����Ƶ�� 
%n=0:1/Fs:1; 

N=16;
n=0:15;
xn=sin(2*pi*n/N)+cos(4*pi*n/N);

%������������������ 
%xn=sin(2*pi*40*n)+cos(4*pi*40*n);%+randn(size(n)); 
%xn=sin(2*pi*n/N)+cos(4*pi*n/N);

window=boxcar(length(xn)); %���δ� 
nfft=1024; 
[Pxx,f]=periodogram(xn,window,nfft,Fs); %ֱ�ӷ� 
plot(f,10*log10(Pxx)); 
