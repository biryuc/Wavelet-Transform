clear
arr_copd = ['A_COPD/109_1b1_Ar_sc_Litt3200.wav','A_COPD/107_2b3_Al_mc_AKGC417L.wav','110_1p1_Al_sc_Meditron','112_1b1_Ar_sc_Meditron','113_1b1_Al_sc_Litt3200',...
    '114_1b4_Al_mc_AKGC417L','118_1b1_Ar_sc_Litt3200','120_1b1_Ar_sc_Meditron','124_1b1_Al_sc_Litt3200','130_1p2_Ar_mc_AKGC417L'];
arr_healthy = ['102_1b1_Ar_sc_Meditron.wav','123_1b1_Al_sc_Meditron','126_1b1_Al_sc_Meditron','127_1b1_Ar_sc_Meditron','136_1b1_Ar_sc_Meditron',...
    '143_1b1_Al_sc_Meditron','144_1b1_Al_sc_Meditron','152_1b1_Al_sc_Meditron','153_1b1_Al_sc_Meditron','159_1b1_Ar_sc_Meditron'];
%[y_healthy,fs_healthy] = audioread( 'useful_Ar_Al_healthy/159_1b1_Ar_sc_Meditron.wav' );
% [y_COPD,fs_COPD] = audioread( 'A_COPD/130_1p2_Ar_mc_AKGC417L.wav');

sp = 17.142857*1000;
A = importdata ('1.txt');
size_ = size(A(:,1));
lenght = size(A(:,1))/sp;

t = linspace(0,lenght(1),size_(1));
% y = normal(y_COPD,fs_COPD);
%plot(t,A(:,1))

% [cfs,f] = cwt(y,fs,'amor');
% contour(time,f,abs(cfs))
% grid on
% c = colorbar;
%normal(A(:,1),sp)
plot_(A(:,1),sp)
function plot_(norm_arr,norm_fs)
    [y,time] = normal(norm_arr,norm_fs);
    [cfs,f] = cwt(y,norm_fs,'amor');
    contour(time,f,abs(cfs))
    ylim([0 1000])
    grid on
    colorbar;
    clim([0 1]);
end
function [res,t] = normal(arr,fs_)
    coef_ = 1/max(arr);
    size_ = size(arr);
    lenght = size(arr)/fs_;
    for i=1:size_
    arr(i)=arr(i)*coef_;
    end
    res =arr;
    time = linspace(0,lenght(1),size_(1));
    t = time;
%     time = 0:lenght:fs_;
    xlabel('Seconds')
    ylabel('Frequency')
    plot(time,arr)
end