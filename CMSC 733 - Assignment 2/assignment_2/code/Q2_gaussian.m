clear all;
close all;
clc;

img = [9 10 9 4 3; 5 7 8 9 3; 4 5 6 8 5; 3 4 5 6 8; 2 3 4 5 6]

% Gaussian Filter %
gaussian = (1/16)*[1 2 1; 2 4 2; 1 2 1];

center_img = img(2:4,2:4);

for i= 1:3
    for j = 1:3
        center_img(i,j) = center_img(i,j) * gaussian(i,j);
    end
end
filter_val = 0;
filter_val = filter_val + sum(center_img(:,1)) + sum(center_img(:,2)) + sum(center_img(:,3));
gauss_img = img;
gauss_img(3,3) = filter_val;
gauss_img
