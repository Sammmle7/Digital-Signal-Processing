% Zhou Zhiguo
% 2019.8.7
% Ch5 �����˲������

clear; 
close all;
clc;

[b,a]=butter(8,.5);
Hq = dfilt.df2t(b,a);
Hq.arithmetic = 'fixed';
Hq1 = sos(Hq);