clc
clear
close all
beta = (0:1000)*4/1000;

zeta_values = [0.01 , 0.1 , 0.25 , 0.5 , sqrt(2)/2 , 1 , 2];

for i = 1:length(zeta_values)
    zeta = zeta_values(i);
    D_values(:, i) = 1./((1-beta.^2).^2 + (2*zeta*beta).^2).^0.5;
end

% Plot D vs beta for different damping ratios with logarithmic y-axis
semilogy (beta, D_values, 'linewidth', 1.5);

grid on
xlabel(' Frequency ratio [\beta]' , 'fontsize', 14)
ylabel('Amplification factor [D]', 'fontsize', 14)
title('Amplification Factor for Different Damping Ratios')
legend('\zeta= 0.01', '\zeta=0.1', '\zeta=0.25', '\zeta=0.5', '\zeta= sqrt(2)/2', '\zeta=1', '\zeta=2')
