%% Initialize Workspace %%
clear all;
close all;
clc;
%% Initialize Variables %%
M = 1;
K = 1;
rho = 0.1;
x0 = 1;
xd = 0;
syms('gamma','tau');
ll = 0;
hl = 10;
A = [0 1; -1 -0.1];
B = [0;1];
C = [1 0];
D = 0;
%% Gramian Equation %%
gram_eqn = expm(A.*gamma)*B*transpose(B)*expm(transpose(A).*gamma);
Wc = int(gram_eqn,gamma,ll,hl);
%% Control Law %%
U = simplify(transpose(B)*expm(transpose(A).*(hl-tau))*inv(Wc)*(xd-expm(A.*hl)*x0));
%% Verify Control Law %%
sim('check_control');
open_system('check_control/Control');