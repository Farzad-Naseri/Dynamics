clc
clear
close all

beta = (0:1000)*4/1000;
zeta_values = [0.01, 0.1, 0.25, 0.5, sqrt(2)/2, 1, 2];

% Calculate phi for each damping ratio
for i = 1:length(zeta_values)
    zeta = zeta_values(i);
    phi_values(:, i) = atan(2*zeta*beta./(1-beta.^2));
    phi_values(phi_values(:,i)<0,i)=phi_values(phi_values(:,i)<0,i)+pi; 
end

plot (beta, 180/pi*phi_values, 'linewidth', 1.5);

% Plot phi vs beta for different damping ratios

grid on
xlabel('Frequency Ratio \beta', 'fontsize', 14)
ylabel('Phase angle \phi (degrees)', 'fontsize', 14)
title('Phase Angle for Different Damping Ratios')
legend('\zeta= 0.01', '\zeta=0.1', '\zeta=0.25', '\zeta=0.5', '\zeta=sqrt(2)/2', '\zeta=1', '\zeta=2')
