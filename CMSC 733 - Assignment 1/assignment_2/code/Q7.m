clear all
close all
clc
format shortE
format loose

%%% 7(a) - Compute Pixel Positions %%%

% Calibration Parameters %
f_x = 600/2; % x focal length in pixels %
f_y = 500/2; % y focal length in pixels %
x_0 = -690; % x center of image in pixels %
y_0 = 690; % y center of image in pixels %
s = 0; % skew parameter %

% Calibration Matrix K %
K = [f_x s x_0 0 ; 0 f_y y_0 0; 0 0 0 1];

% Camera Tilted at 20 degrees %
R = [1 0 0 0; 0 cosd(20) sind(20) 0; 0 -sind(20) cosd(20) 0; 0 0 0 1];

% Camera Translated at 3m along y-axis %
T = [1 0 0 0; 0 1 0 -3; 0 0 1 0; 0 0 0 1];

% Projection Matrix %
P = K*R*T;

% Finding Coordinates of corners of regular squares %

% Square 1 %
% P_1 center = 3/tand(20);%
P1_center = [0 0 8.24];
P1_1 = [-2 0 6.24 1];
P1_2 = [-2 0 10.24 1];
P1_3 = [2 0 10.24 1];
P1_4 = [2 0 6.24 1];

originalX1 = [P1_1(1),P1_2(1),P1_3(1),P1_4(1),P1_1(1)];
originalY1 = [P1_1(3),P1_2(3),P1_3(3),P1_4(3),P1_1(3)];
figure
plot(originalX1, originalY1);
hold on
% Square 2 %
% We get distance between two centers of squares at 17.4 %
% Since road is curved, we get 17.4*cosd(10) and 17.4*sind(10) as coords %

P2_center = [-3.02 0 25.37]';

% Rotate each point since road is curved %
R_2 = [cosd(-10) 0 sind(-10); 0 1 0; -sind(-10) 0 cosd(-10)];
L_1 = [2 0 -2]';
L_2 = [2 0 2]';
L_3 = [-2 0 2]';
L_4 = [-2 0 -2]';

P2_1 = (R_2 * L_1) + P2_center;
P2_2 = (R_2 * L_2) + P2_center;
P2_3 = (R_2 * L_3) + P2_center;
P2_4 = (R_2 * L_4) + P2_center;

originalX2 = [P2_1(1),P2_2(1),P2_3(1),P2_4(1),P2_1(1)];
originalY2 = [P2_1(3),P2_2(3),P2_3(3),P2_4(3),P2_1(3)];
plot(originalX2, originalY2);
hold off

% Applying Projection Matrix P on Coordinates of Squares %

% Square 1 %
p1_1 = P * P1_1';
p1_1 = p1_1((1:2))

p1_2 = P * P1_2';
p1_2 = p1_2((1:2))

p1_3 = P * P1_3';
p1_3 = p1_3((1:2))

p1_4 = P * P1_4';
p1_4 = p1_4((1:2))

X1_points = [p1_1(1),p1_2(1),p1_3(1),p1_4(1),p1_1(1)];
Y1_points = [p1_1(2),p1_2(2),p1_3(2),p1_4(2),p1_1(2)];

% Square 2 %
p2_1 = P * [P2_1;1];
p2_1 = p2_1((1:2))

p2_2 = P * [P2_2;1];
p2_2 = p2_2((1:2))

p2_3 = P * [P2_3;1];
p2_3 = p2_3((1:2))

p2_4 = P * [P2_4;1];
p2_4 = p2_4((1:2))

X2_points = [p2_1(1),p2_2(1),p2_3(1),p2_4(1),p2_1(1)];
Y2_points = [p2_1(2),p2_2(2),p2_3(2),p2_4(2),p2_1(2)];


%%% 7(b) - Plot Pixel Positions %%%
figure
plot(X1_points, Y1_points)
hold on
plot(X2_points, Y2_points)