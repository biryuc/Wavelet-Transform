clear
sp = 17.142857*1000;  % Частота дискретизации по умолчанию

signal1 = importdata ('19.txt');

num = 1;


fs_ = sp;

lbound = 137000;

arr_1 = signal1(1:lbound,1);
arr_2 = signal1(1:lbound,2);
arr_3 = signal1(1:lbound,3);
arr_4 = signal1(1:lbound,4);
arr_5 = signal1(1:lbound,5);
arr_6 = signal1(1:lbound,6);

size_ = size(arr_1);
lenght = size_/fs_;
time = linspace(0,lenght(1),size_(1));

%     arr_ = normal(arr_,size_); %Нормировка

wav_ ='amor';

[cfs1,f1] = cwt(arr_1,fs_,wav_);
[cfs2,f2] = cwt(arr_2,fs_,wav_);
[cfs3,f3] = cwt(arr_3,fs_,wav_);
[cfs4,f4] = cwt(arr_4,fs_,wav_);
[cfs5,f5] = cwt(arr_5,fs_,wav_);
[cfs6,f6] = cwt(arr_6,fs_,wav_);

% [c,lags] = xcorr(cfs1(1,:),cfs2(1,:),"normalized");
% % stem(lags,c)
% c
% % c_mean = mean(c);
% size(cfs1(:,1))

size_for = size(cfs1(:,1));

for i=1:size_for(1)
    arrcoef1(i,:) = xcorr(abs(cfs1(i,:)),abs(cfs2(i,:)),"normalized");
    
    arrcoef_mean1(i)= mean(arrcoef1(i,:));
end

for i=1:size_for(1)
    arrcoef2(i,:) = xcorr(abs(cfs3(i,:)),abs(cfs4(i,:)),"normalized");
    
    arrcoef_mean2(i)= mean(arrcoef2(i,:));
end


for i=1:size_for(1)
    arrcoef3(i,:) = xcorr(abs(cfs5(i,:)),abs(cfs6(i,:)),"normalized");
    
    arrcoef_mean3(i)= mean(arrcoef3(i,:));
end


commom_mean1 = mean(arrcoef_mean1)
commom_mean2 = mean(arrcoef_mean2)
commom_mean3 = mean(arrcoef_mean3)

total_mean = (commom_mean1 + commom_mean2 + commom_mean3)/3