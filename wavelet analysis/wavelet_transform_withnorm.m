clear
% % % % % % % % % % % Анализ файлов Медси %%%%%%%%%%%%%%%%%%%%%%%%%



% % % % % % % % % % % Загрузка файла %%%%%%%%%%%%%%%%%%%%%%%%% Доделать

sp = 17.142857*1000;  % Частота дискретизации по умолчанию

signal = importdata ('25.txt');
size_signal = size(signal(:,5));
% signal(:,7)
lenght = size_signal/sp;
lenght(:,1); % Длина файла
% % % % % % % % % % % Загрузка файла %%%%%%%%%%%%%%%%%%%%%%%%%



% % % % % % % % % % %  Непрерывное Вейвлет преобразование %%%%%%%%%%%%%%%%%%%%%%%%%
% "morse" (default) | "amor" | "bump" Возможные вейвлеты для cwt

% plot_(signal,sp,6)
% % % % % % % % % % % Непрерывное Вейвлет преобразование %%%%%%%%%%%%%%%%%%%%%%%%%
size_ = size(signal(1:137000,4));
res_ = normal(signal(1:137000,4),size_)
cwt(res_,sp)
% ylim([0 1000])
grid on
colorbar;
% clim([0 1]);
xlabel('Time,s')
ylabel('Frequency,Hz')
title('Wavelet transform amplitude')
% % % % % % % % % % %  Нормировка сигнала %%%%%%%%%%%%%%%%%%%%%%%%%



function plot_(norm_arr,norm_fs,num)
    [y,time] = normal(norm_arr,norm_fs,num);
    [cfs,f] = cwt(y,norm_fs,'amor');
   
    contour(time,f,abs(cfs))
    ylim([0 1000])
    grid on
    colorbar;
    clim([0 1]);
    xlabel('Seconds')
    ylabel('Frequency')
   
end
% function [res,t] = normal(arr,fs_,num)
%     coef_ = 1/max(arr(:,num));
%     size_ = size(arr(:,num));
%     lenght = size(arr(:,num))/fs_;
%     arr_ = arr(:,num);
%     for i=1:size_
%     arr_(i)=arr_(i)*coef_;
%     end
%     res =arr_;
%     time = linspace(0,lenght(1),size_(1));
%     t = time;
% %     time = 0:lenght:fs_;
% %     xlabel('Seconds')
% %     ylabel('Frequency')
% %     plot(time,arr_)
% end

function res = normal(arr,size_)
    coef_ = 1/max(arr);
    for i=1:size_
    arr(i)=arr(i)*coef_;
    end
    res =arr;
end
% % % % % % % % % % % Нормировка сигнала  %%%%%%%%%%%%%%%%%%%%%%%%%





