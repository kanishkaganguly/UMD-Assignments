clear all;
close all;
clc;

img = [9 10 9 4 3; 5 7 8 9 3; 4 5 6 8 5; 3 4 5 6 8; 2 3 4 5 6]

% Median Filter %
center_img = img(2:4,2:4);
arr = center_img(:);
median = median(arr);
median_img = img;
median_img(3,3) = median;
median_img