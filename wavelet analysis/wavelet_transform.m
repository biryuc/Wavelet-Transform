clear
% % % % % % % % % % % Анализ файлов Медси %%%%%%%%%%%%%%%%%%%%%%%%%



% % % % % % % % % % % Загрузка файла %%%%%%%%%%%%%%%%%%%%%%%%% Доделать

sp = 17.142857*1000;  % Частота дискретизации по умолчанию

signal = importdata ('19.txt');
% size_signal = size(signal(:,5));
% signal(:,7)
% lenght = size_signal/sp;
% lenght(:,1); % Длина файла
% % % % % % % % % % % Загрузка файла %%%%%%%%%%%%%%%%%%%%%%%%%


% 23- жёсткое 19-везикулярное 13?30?
% % % % % % % % % % %  Непрерывное Вейвлет преобразование %%%%%%%%%%%%%%%%%%%%%%%%%
% "morse" (default) | "amor" | "bump" Возможные вейвлеты для cwt

% % % % % % % % % % % Непрерывное Вейвлет преобразование %%%%%%%%%%%%%%%%%%%%%%%%%
% signal(:,1)
wavetrans_(signal,sp,6)
% % % % % % % % % % %  Нормировка сигнала %%%%%%%%%%%%%%%%%%%%%%%%%
function wavetrans_(arr,fs_,num)
%     [y,time] = normal(norm_arr,norm_fs,num);
    lbound = 137000;
%     lbound = 394285;
    arr_ = arr(1:lbound,num);
    size_ = size(arr_);
    lenght = size_/fs_;
    time = linspace(0,lenght(1),size_(1));

%     arr_ = normal(arr_,size_); %Нормировка

    [cfs,f] = cwt(arr_,fs_,'morse');

    tiledlayout(1,1)

    nexttile
    contour(time,f,abs(cfs))
    ylim([100 1000])
    grid on
    colorbar;
    clim([0 1]);
    xlabel('Time,s')
    ylabel('Frequency,Hz')
    title('Wavelet transform amplitude')
% 
%     nexttile
%     plot(time,arr_)
%     xlabel('Time,s')
%     ylabel('Amplitude')
%     title('Raw signal')
% 
%     nexttile
% %     plot(time,arr_)
%     plot(time,arr(1:lbound,7))
%     xlabel('Time,s')
%     ylabel('Amplitude')
%     title('Breathing cycles')
   
    
end
% % % % % % % % % % % Нормировка  %%%%%%%%%%%%%%%%%%%%%%%%%
function res = normal(arr,size_)
    coef_ = 1/max(arr);
    for i=1:size_
    arr(i)=arr(i)*coef_;
    end
    res =arr;
end
% % % % % % % % % % % Отрисовка  %%%%%%%%%%%%%%%%%%%%%%%%%
function show_(time,f,cfs)
    contour(time,f,abs(cfs))
    ylim([0 1000])
    grid on
    colorbar;
    clim([0 1]);
    xlabel('Time,s')
    ylabel('Frequency,Hz')
    title('Wavelet transform amplitude')
end





