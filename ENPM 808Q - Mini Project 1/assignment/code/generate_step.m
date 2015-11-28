%% Initialize Workspace
clear all;
close all;
clc;
%% Initializing State Variable
A = [0 1; -1 -0.1];
B = [0;1];
C = [1 0];
D = 0;
%% Plotting Unit Step Response Through Simulation
sys = ss(A,B,C,D);
figure
step(sys,5);
title('Step Response (Simulation)');
[samples,time] = step(sys,5);