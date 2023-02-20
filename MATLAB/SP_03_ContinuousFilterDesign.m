% Prof. Dr. ir. Meshia Cédric OVENEKE
% cedric.oveneke@fitforpurpose.tech
% 2023

clc;
close all;

% Define Butterworth filter
w = 0:0.01:2; %omega
n = 8; % filter order
wc = 0.75; % cut-off frequency
H = 1./sqrt(1 + (w/wc).^(2*n)); %non-rational form
H_ideal = zeros(size(w)); % ideal filter
H_ideal(w <= wc) = 1.0;

figure();
plot(w, H, 'LineWidth', 2);
hold on;
plot(w, H_ideal, 'LineWidth', 2, 'LineStyle', '--');
ylim([0 1]);
xlabel('Frequency w');
ylabel('Power |H(jw)|');
title('Power Spectrum of Butterworth Filter');
grid on;
legend('Approximated Filter', 'Ideal Filter');


% Supperpose multiple Butterworth filters
wc = 1.0;
figure();
plot(w, H_ideal, 'LineWidth', 2, 'LineStyle', '--');
hold on;
for n = 1:2:50
    H = 1./sqrt(1 + (w/wc).^(2*n)); %non-rational form
    plot(w, H, 'LineWidth', 2);
    hold on;
    ylim([0 1]);
    xlabel('Frequency w');
    ylabel('Power |H(jw)|');
    title('Power Spectrum of Butterworth Filter');
    grid on;
end


