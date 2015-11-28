clear all
close all
clc
format shortE
format loose

%%% Declare Variables %%%
R_ = zeros();
K = zeros();

%%% CAMERA MATRIX %%%
fprintf('The Camera Matrix is')
P = [3.53*(10^2), 3.39*(10^2), 2.77*(10^2), 1.44*(10^6); ...
    -1.03*(10^2), 2.33*(10^1), 4.59*(10^2), -6.32*(10^5); ...
    7.07*(10^-1), -3.53*(10^-1), 6.12*(10^-1), -9.18*(10^2)
    ]
%%% We know that P = [M | -MC] %%%
%%% So, we discard last column of P %%%
M = P(:,(1:3));
MC = P(:,4);

%%% r-q Decomposition on M %%%
[R, Q] = rq(M);

%%% Now, K = R and R_ = Q matrices for M = K x R_ %%%
K = R
R_ = Q;

%%% To get C (camera center) %%%
C = -(-MC)\M;

%%% So, we have the camera parameters as follows %%%
fprintf('Focal Lengths (pixels): Ax = %.3f and Ay = %.3f\n',K(1,1),K(2,2))
fprintf('Image Center (pixels): X0 = %.3f and Y0 = %.3f\n', K(1,3),K(2,3))
fprintf('Skew Parameter: S = %.3f\n', K(1,2))
fprintf('Camera Center: (%f, %f, %f)\n', C(1), C(2), C(3))