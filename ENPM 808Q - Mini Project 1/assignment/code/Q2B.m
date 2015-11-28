%% Initializing State Variable
A = [0 1; -1 -0.1];
B = [0;1];
C = [1 0];
D = 0;
syms('t');
%% Plotting Unit Step Response Through Simulation
sys = ss(A,B,C,D);
figure
step(sys,5);
title('Step Response (Simulation)');
[y,time] = step(sys,5);
%% Creating Lookup Table for Series Calculation
eAt_arr = zeros(20,2,2);
for i=1:20
    eAt_arr(i,:,:) = (A^i)/factorial(i);
end
%% Integrating For Each 'time' 
vals = zeros();
for i=1:size(time)
    h = time(i);
    eAt = [1 0; 0 1];
    for k = 1:20
        eAt = eAt + permute(eAt_arr(k,:,:).*((h-t)^k),[2,3,1]);
    end
    y = C * eAt * B;
    vals = [vals vpa(int(y,[0 h]),5)];
end
%% Plotting Unit Step Response Using Analytical Computation
figure
plot(time, vals(1:size(time)))
title('Step Response (Analytical)');