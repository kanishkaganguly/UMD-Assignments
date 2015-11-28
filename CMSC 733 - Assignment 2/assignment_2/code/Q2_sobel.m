clear all;
close all;
clc;

img = [9 10 9 4 3; 5 7 8 9 3; 4 5 6 8 5; 3 4 5 6 8; 2 3 4 5 6];
sobel_x = (1/8)*[-1 0 1; -2 0 2; -1 0 1];
sobel_y = (1/8)*[1 2 1; 0 0 0; -1 -2 -1];

center_img = img(2:4,2:4);

for i= 1:3
    for j = 1:3
        center_img(i,j) = center_img(i,j) * sobel_x(i,j);
    end
end
sobel_x_val = sum(center_img(:,1)) + sum(center_img(:,2)) + sum(center_img(:,3));

center_img = img(2:4,2:4);
for i= 1:3
    for j = 1:3
        center_img(i,j) = center_img(i,j) * sobel_y(i,j);
    end
end
sobel_y_val = sum(center_img(:,1)) + sum(center_img(:,2)) + sum(center_img(:,3));

edge_direction = atand(sobel_y_val/sobel_x_val)
edge_strength = sqrt(sobel_x_val^2 + sobel_y_val^2)