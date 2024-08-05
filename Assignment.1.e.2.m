clc;
clear;
close all;

k = 100; % N/m
m = 10; % kg
zeta_values = [0, 0.05, 0.1, 0.5]; % Different damping ratios

t = (0:200) * 0.05;

x_0 = 20;
v_0 = 0.;

figure;

for j = 1:length(zeta_values)
    zeta = zeta_values(j);
    omega = sqrt(k / m);
    omegaD = omega * sqrt(1 - zeta^2); % Calculate omegaD for each zeta
    
    if zeta < 1    
        A = x_0;
        B = (v_0 + x_0 * omega * zeta) / omegaD;
        X = sqrt(A^2 + B^2);
        phi = atan(B / A);
        x = X * exp(-zeta * omega * t) .* cos(omegaD * t - phi);
        l1 = X * exp(-omega * zeta * t);
        l2 = -X * exp(-omega * zeta * t);
        plot(t, x, 'LineWidth', 1.5);
        hold on;
       
    elseif zeta == 1
        x = exp(-omega * t) .* (x_0 * (1 + omega * t) + v_0 * t);
        plot(t, x, 'LineWidth', 1.5);
    else
        omegaD2 = omega * sqrt(-1 + zeta^2);
        c1 = x_0 / 2 + v_0 / 2 / omegaD + zeta * omega * x_0 / omegaD2 / 2;
        c2 = x_0 / 2 - v_0 / 2 / omegaD - zeta * omega * x_0 / omegaD2 / 2;
        x = exp(-zeta * omega * t) .* (c1 * exp(omegaD2 * t) + c2 * exp(-omegaD2 * t));
        plot(t, x, 'LineWidth', 1.5);
    end
end

xlabel('time [s]', 'fontsize', 14);
ylabel('Displacement [mm]', 'fontsize', 14);
title('System Response for Different Damping Ratios');
legend('\zeta = 0', '\zeta = 0.05', '\zeta = 0.1', '\zeta = 0.5');
grid on;