 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   上实交通采集样本处理程序                                %
%   一般测试                                               %
%   Author:Cao Yiwen@SJTU                                  %
%   Date:2018.02.18                                        %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc;
clear all;
close all;

% rss=xlsread('Graph 2018-02-22 173641.csv');
% plot(rss,'r');

rss=xlsread('rssi_ShangShi_2m.xlsx');
k=1;
for i=1:75
    for j=1:7
        
        rss_new(k)=rss(i,j);
        k=k+1;
    end
end
avg=mean(rss_new);
sigma=sqrt(var(rss_new));
    plot(rss_new,'r');
   figure();
%% Kalman Filter
A=1;
C=1;
R=7;%10        %1    
Q=0.2;%0.005   %0.1
kalman_filter_1 = kalman(rss_new, A, C, R, Q);
plot(kalman_filter_1,'--b^');
avg1=mean(kalman_filter_1);
sigma1=sqrt(var(kalman_filter_1));
    