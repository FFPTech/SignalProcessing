% Prof. Dr. ir. Meshia Cédric OVENEKE
% cedric.oveneke@fitforpurpose.tech
% 2023

clc;
close all;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ù
% Design Low-Pass Digital Filter

Fp = 0.37; 
Fs = 0.43;
Ap = 1; % (dB)
As = 60; %(dB)
df1 = designfilt( ...
    'lowpassfir', ...
    'PassbandFrequency', Fp, ...
    'StopbandFrequency', Fs, ...
    'PassbandRipple', Ap, ...
    'StopbandAttenuation', As);
fv = fvtool(df1);

% display order
N = filtord(df1);
disp('DF1: Order');
disp(N);

% display coefficients
coeffs = df1.Coefficients;
disp('DF1: Coefficients');
display(coeffs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ù
% Design High-Pass Digital Filter

Fp = 0.80; 
Fs = 0.70;
Ap = 5; % (dB)
As = 60; %(dB)
df2 = designfilt( ...
    'highpassfir', ...
    'PassbandFrequency', Fp, ...
    'StopbandFrequency', Fs, ...
    'PassbandRipple', Ap, ...
    'StopbandAttenuation', As);
fv = fvtool(df2);

% display order
N = filtord(df2);
disp('DF2: Order');
disp(N);

% display coefficients
coeffs = df2.Coefficients;
disp('DF2: Coefficients');
display(coeffs);




