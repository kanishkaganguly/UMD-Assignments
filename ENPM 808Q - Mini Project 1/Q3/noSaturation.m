clear all;
close all;
clc;
K = 1;
M = 1;
rho = 0.1;
A = [0 1; -K/M -rho/M];
B = [0; 1];
C = [1 0];
D = 0;
xr = 4;

% Without Saturation %
k_p = 1.5;
k_i = 2;
k_d = 1.6;

% With Saturation %
%k_p = 5;
%k_i = 0;
%k_d = -5;

sim('PID_noSaturation','StopTime', '20');
open_system('PID_noSaturation/out');