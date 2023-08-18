


% % % % % % % % % % % % % % % % % % 
% CHIRP
% t = 0:1/1e3:1.5;
% y = chirp(t,100,1,150,'quadratic');
% % % % % % % % % % % % % % % % % 
% Heart
t = linspace(0,200,20000);
length(t)
A = importdata('S_arr_Heart50.txt');
 


[cfs,f] = cwt(A,'amor',10000);
contour(t,f,abs(cfs))
xlabel('Time,s');
ylabel('Frequency');
grid on
colorbar;
% clim([0 1]);

% pspectrum(y,1e3,'spectrogram','TimeResolution',0.1, ...
%     'OverlapPercent',99,'Leakage',0.85)

function res = A_a_p(t)
    res = (1- exp(-t/8))*exp(-t/16)*sin(pi*t/60);
    res
end


function res = Second_heart_sound_signal(t,t_0)
    if t-t_0 > 0
        a = 0; 
    else
        t = t_0;
    res =  A_a_p(t)*sin(2.*pi*(24.3*t + 451.3*sqrt(t))*(1e-3)) + 0.5*A_a_p(t-t_0)*sin(2*pi*(21.83*(t-t_0)+356.34*sqrt(t-t_0))*(1e-3));
    end
end