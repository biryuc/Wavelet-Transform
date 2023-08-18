A = importdata ('Model_noise_out1.txt');
% lenght = 22.999958;
% sp = 17.142857*1000;
% t = linspace(0,lenght,394285);
% plot(t,A(:,7))

% [imf_vmd,~,info_vmd] = vmd(A(:,1));
% plot(imf_vmd,t,'vmd','VMD',[1 2 3 5]);
% 
% plot(t,imf_vmd(:,5));
% info_vmd.CentralFrequencies*sp
plot(A(:,1),A(:,2))
xlabel('Frequency')
ylabel('nV/sqrt(Hz)')