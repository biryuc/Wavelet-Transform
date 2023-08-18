clear
arr_copd = ['A_COPD/109_1b1_Ar_sc_Litt3200.wav','A_COPD/107_2b3_Al_mc_AKGC417L.wav','110_1p1_Al_sc_Meditron','112_1b1_Ar_sc_Meditron','113_1b1_Al_sc_Litt3200',...
    '114_1b4_Al_mc_AKGC417L','118_1b1_Ar_sc_Litt3200','120_1b1_Ar_sc_Meditron','124_1b1_Al_sc_Litt3200','130_1p2_Ar_mc_AKGC417L'];

fs = 17.142857*1000;
[y_COPD,fs_COPD] = audioread( 'A_COPD/130_1p2_Ar_mc_AKGC417L.wav');

[cfs,f] = cwt(y_COPD,fs_COPD,'amor');

size(cfs)