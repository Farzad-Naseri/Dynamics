% Define damping ratios
zeta = 0:0.005:0.2; % Range of damping ratios from 0 to 0.2 with 0.05 spacing

% Calculate number of cycles for 50% reduction in amplitude
num_cycles = (1 ./ (2*pi*zeta)) .* log(2);

% Plot the diagram
figure;
plot(zeta, num_cycles, 'LineWidth', 1.5);
xlabel('Damping Ratio (\zeta)');
ylabel('Number of Cycles ');
title('Damping Ratio vs Number of Cycles Required for 50% Reduction ');
grid on;

% Set axis limits and ticks
xlim([0 0.2]);
ylim([0 6]);
xticks(0:0.05:0.2);
yticks(0:1:6);