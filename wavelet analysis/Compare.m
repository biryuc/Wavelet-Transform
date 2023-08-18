% n = 0:15;
% x = 0.84.^n;
% y = circshift(x,5);
% [c,lags] = xcorr(x,y,10,'normalized');
% stem(lags,c)

sp = 17.142857*1000;  % Частота дискретизации по умолчанию
% sp = 18*1000;
arr = importdata ('19.txt');
signal = importdata ('44.txt');

lbound = 94200;
% lbound = 137000;

signal_1 = signal(1:lbound,1);
signal_2 = signal(1:lbound,2);
signal_3 = signal(1:lbound,3);
signal_4 = signal(1:lbound,4);
signal_5 = signal(1:lbound,5);
signal_6 = signal(1:lbound,6);
signal_7 = signal(1:lbound,7);

arr_1 = arr(1:lbound,1);
arr_2 = arr(1:lbound,2);
arr_3 = arr(1:lbound,3);
arr_4 = arr(1:lbound,4);
arr_5 = arr(1:lbound,5);
arr_6 = arr(1:lbound,6);
arr_7 = arr(1:lbound,7);



size_ = size(arr_1);
lenght = size_/sp;
time = linspace(0,lenght(1),size_(1));
fs_ = sp;


wavelet_ = 'morse';



[scfs1,sf1] = cwt(signal_1,fs_,wavelet_);
[scfs2,sf2] = cwt(signal_2,fs_,wavelet_);
[scfs3,sf3] = cwt(signal_3,fs_,wavelet_);
[scfs4,sf4] = cwt(signal_4,fs_,wavelet_);
[scfs5,sf5] = cwt(signal_5,fs_,wavelet_);
[scfs6,sf6] = cwt(signal_6,fs_,wavelet_);



[cfs1,f1] = cwt(arr_1,fs_,wavelet_);
[cfs2,f2] = cwt(arr_2,fs_,wavelet_);
[cfs3,f3] = cwt(arr_3,fs_,wavelet_);
[cfs4,f4] = cwt(arr_4,fs_,wavelet_);
[cfs5,f5] = cwt(arr_5,fs_,wavelet_);
[cfs6,f6] = cwt(arr_6,fs_,wavelet_);



tiledlayout(2,3)

nexttile
contour(time,f4,abs(cfs4))
ylim([0 1000])
grid on
colorbar;
clim([0 1]);
xlabel('Time,s')
ylabel('Frequency,Hz')
title('Wavelet transform amplitude, ch4')

nexttile
contour(time,f5,abs(cfs5))
ylim([0 1000])
grid on
colorbar;
clim([0 1]);
xlabel('Time,s')
ylabel('Frequency,Hz')
title('Wavelet transform amplitude, ch5')


nexttile
contour(time,f6,abs(cfs6))
ylim([0 1000])
grid on
colorbar;
clim([0 1]);
xlabel('Time,s')
ylabel('Frequency,Hz')
title('Wavelet transform amplitude, ch6')

nexttile
contour(time,sf1,abs(scfs1))
ylim([0 1000])
grid on
colorbar;
clim([0 1]);
xlabel('Time,s')
ylabel('Frequency,Hz')
title('Wavelet transform amplitude, ch1')

nexttile
contour(time,sf1,abs(scfs1))
ylim([0 1000])
grid on
colorbar;
clim([0 1]);
xlabel('Time,s')
ylabel('Frequency,Hz')
title('Wavelet transform amplitude, ch1')

nexttile
contour(time,sf1,abs(scfs1))
ylim([0 1000])
grid on
colorbar;
clim([0 1]);
xlabel('Time,s')
ylabel('Frequency,Hz')
title('Wavelet transform amplitude, ch1')

% nexttile
% plot(time,arr_7)
% xlabel('Time,s')
% ylabel('Amplitude')
% title('Breathing cycles')

