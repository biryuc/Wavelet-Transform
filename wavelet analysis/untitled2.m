sp = 17.142857*1000;
A = importdata ('1.txt');

%cwt(A(:,1),sp)
time = linspace(0,lenght,394285);
[cfs,freq] = cwt(A(:,1),100:132,'fk22',sp,'scal');
contour(time,freq,cfs) 
grid on
c = colorbar;
xlabel('Seconds')
ylabel('Frequency')

%time = linspace(0,lenght,394285);
