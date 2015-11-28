%% Initialize Variables %%
syms('M','K','rho');
%% Plot Samples %%
plot(time, samples);
%% Solving %%
rng('default');
r = randi(96);
r1 = r+1;
r2 = r+2;
r3 = r+3;
r4 = r+4;

diff_val1 = (samples(r1)-samples(r))/(time(r1)-time(r)); %Differentiation from Slope
int_val1 = (0.5*(time(r1)-time(r))*(samples(r1)-samples(r))) + ((samples(r))*(time(r1)-time(r))); %Integration from Area Under Curve

diff_val2 = (samples(r2)-samples(r1))/(time(r2)-time(r1)); %Differentiation from Slope
int_val2 = (0.5*(time(r2)-time(r1))*(samples(r2)-samples(r1))) + ((samples(r1))*(time(r2)-time(r1))); %Integration from Area Under Curve

diff_val3 = (samples(r3)-samples(r2))/(time(r3)-time(r2)); %Differentiation from Slope
int_val3 = (0.5*(time(r3)-time(r2))*(samples(r3)-samples(r2))) + ((samples(r3))*(time(r3)-time(r2))); %Integration from Area Under Curve

diff_val4 = (samples(r4)-samples(r3))/(time(r4)-time(r3)); %Differentiation from Slope
int_val4 = (0.5*(time(r4)-time(r3))*(samples(r4)-samples(r3))) + ((samples(r4))*(time(r4)-time(r3))); %Integration from Area Under Curve
%% Forming Equations %%
eqn1 = M*(diff_val2-diff_val1) - (time(r1)-time(r)) + rho*(samples(r1)-samples(r)) + K*(int_val2-int_val1) == 0;
eqn2 = M*(diff_val3-diff_val2) - (time(r2)-time(r1)) + rho*(samples(r2)-samples(r1)) + K*(int_val3-int_val2) == 0;
eqn3 = M*(diff_val4-diff_val3) - (time(r3)-time(r2)) + rho*(samples(r3)-samples(r2)) + K*(int_val4-int_val3) == 0;
%% Solving for M, K, rho %%
S = solve([eqn1, eqn2, eqn3],[M,K,rho]);
M_out = eval(S.M)
K_out = eval(S.K)
rho_out = eval(S.rho)