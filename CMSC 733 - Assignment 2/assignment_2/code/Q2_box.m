clear all;
close all;
clc;

img = [9 10 9 4 3; 5 7 8 9 3; 4 5 6 8 5; 3 4 5 6 8; 2 3 4 5 6]

% Box Filter %
center_img = img(2:4,2:4);
avg = (sum(center_img(:,1)) + sum(center_img(:,2)) + sum(center_img(:,3)))/9;
box_img = img;
box_img(3,3) = avg;
box_img