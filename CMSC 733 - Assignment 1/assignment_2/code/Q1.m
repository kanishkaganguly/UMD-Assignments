clear all
close all
clc

%{
GIVEN THAT

Calibrated Camera with f = 1 and origin at (0, 0, -3)
Camera rotated at -45 deg
%}

%%% World Coordinates of Cube %%%
P1 = [0 -0.5 0];
P2 = [1 -0.5 0];
P3 = [1 -0.5 1];
P4 = [0 -0.5 1];
P5 = [0 0.5 0];
P6 = [1 0.5 0];
P7 = [1 0.5 1];
P8 = [0 0.5 1];

%%% Making array of points above %%%
world = [P1 1;P2 1;P3 1;P4 1;P5 1;P6 1;P7 1;P8 1];

%%% Camera Rotation Matrix (Homogenous) %%%
R = [cosd(-45) 0 sind(-45) 0; 0 1 0 0; -sind(-45) 0 cosd(-45) 0; 0 0 0 1];

%%% Camera Translation Matrix (Homogenous) %%%
T = [1 0 0 0; 0 1 0 0; 0 0 1 -3; 0 0 0 1];

%%% Camera Focus Matrix (Homogenous) %%%
f = 1; % focus f = 1 %
F = [f 0 0 0; 0 f 0 0; 0 0 1 0];

%%%  Q1(a) Projection Matrix %%%
Pr = F * R * T;
fprintf('Ans. 1(a) The projection matrix is\n\n')
Pr

%%------------------------------------------------------------------------%

%%% Converting WORLD to IMAGE coordinates %%%
fprintf('Ans. 1(b)\n')
for n = 1:8
    p = Pr * transpose(world(n,:));
    p_x = p(1)/p(3);
    p_y = p(2)/p(3);
    
    %%% Q1(b) Image Coordinates p5, p6, p7, p8 (Homogenous and Non-Homogenous) %%%
    switch(n)
        case {6, 8}
            fprintf('The Camera Coordinate p_%d (Non-Homogenous) is (%.3f, %.3f, %.3f) and p_%d (Homogenous) is (%.3f, %.3f)\n',n,p(1),p(2),p(3),n,p_x,p_y)
        case{5}
            fprintf('The Camera Coordinate p_%d (Non-Homogenous) is (%.3f, %.3f, %.3f) and p_%d (Homogenous) is (%.3f, %.3f)\n',n,p(1),p(2),p(3),n,p_x,p_y)
            % Store Non-Homogenous Coordinates of P5 %
            p_5 = [p(1) p(2) p(3)];
        case{7}
            fprintf('The Camera Coordinate p_%d (Non-Homogenous) is (%.3f, %.3f, %.3f) and p_%d (Homogenous) is (%.3f, %.3f)\n',n,p(1),p(2),p(3),n,p_x,p_y)
            % Store Non-Homogenous Coordinates of P7 %
            p_7 = [p(1) p(2) p(3)];
        otherwise
            fprintf('')
    end
end

%%------------------------------------------------------------------------%

%%% The first 3 columns Projection Matrix gives us the vanishing points of the 3 parallel lines %%%

%%% Q1(c) %%%
fprintf('\nAns. 1(c)\n')
fprintf('The non-homogenous coordinate of vanishing point 1 is (%.3f,%.3f,%.3f)\n',(Pr(1,1)), (Pr(2,1)), (Pr(3,1)))
fprintf('The non-homogenous coordinate of vanishing point 2 is (%.3f,%.3f,%.3f)\n',(Pr(1,2)), (Pr(2,2)), (Pr(3,2)))
fprintf('The non-homogenous coordinate of vanishing point 3 is (%.3f,%.3f,%.3f)\n',(Pr(1,3)), (Pr(2,3)), (Pr(3,3)))

%%------------------------------------------------------------------------%

%%% Q1(d) %%%
fprintf('\nAns. 1(d)\n')
%%% The Non-Homogenous Camera Coordinates of P5 and P7 are p_5 and p_7 %%%

% Finding Line Equation of p_5 - p_7 %
fprintf('X Equation: (x - x_1) / (x_2 - x_1) = t\n')
fprintf('Y Equation: (y - y_1) / (y_2 - y_1) = t\n')
fprintf('Z Equation: (z - z_1) / (z_2 - z_1) = t\n\n')

% Vector v parallel to line %
fprintf('v = <0.283, 0,-1.776>\n')
fprintf('r = <2.553, 0.5, -1.756> + <0.283,0,-1.776>t\n\n')

% In Vector Form %
fprintf('x = 2.553 + 0.283t\n')
fprintf('y = 0.5 + 0t\n')
fprintf('z = -1.756 - 1.776t\n\n')

% Taking Homogenous Form %
fprintf('As t --> infinity, we have\n')
fprintf('x" = x/z ~ 0.283/1.776 = 0.1273\n')
fprintf('y" = y/z ~ 0/1.776 = 0\n')
fprintf('z" = z/z = 1\n')

% Answer %
fprintf('The Coordinates of Vanishing Point of P5-P7 are (%.3f, %.3f, %.3f)\n\n',0.1273,0,1) 

%%------------------------------------------------------------------------%