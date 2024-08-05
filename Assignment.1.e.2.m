clc;
clear;
close all;

k = 100; % N/m spring constant
m = 10; % kg
omega = sqrt(k/m); % circular frequency rad/s
f = omega/(2*pi); % natural frequency in Hz (1/s)
T = 1/f; % period

t = 0:0.01:4;

disp('Initial Conditions for Case 1:');
x_0 = input('x_0 [mm]: ');
v_0 = input('v_0 [mm/s]: ');

x1 = x_0 * cos(omega*t) + v_0/omega * sin(omega*t);

plot(t, x1, 'LineWidth', 1.5);
hold on;

disp('Initial Conditions for Case 2:');
x_0 = input('x_0 [mm]: ');
v_0 = input('v_0 [mm/s]: ');

x2 = x_0 * cos(omega*t) + v_0/omega * sin(omega*t);

plot(t, x2 , 'LineWidth', 1.5);

disp('Initial Conditions for Case 3:');
x_0 = input('x_0 [mm]: ');
v_0 = input('v_0 [mm/s]: ');

x3 = x_0 * cos(omega*t) + v_0/omega * sin(omega*t);

plot(t, x3, 'LineWidth', 1.5);

xlabel('time [s]', 'fontsize', 14);
ylabel('Displacement [mm]', 'fontsize', 14);
grid on;
legend('x0=20 , v0=0', 'x0=0 , v0=50', 'x0=20 , v0=50');
