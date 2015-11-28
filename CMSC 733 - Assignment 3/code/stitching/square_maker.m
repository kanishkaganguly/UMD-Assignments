clear all;
close all;
clc;

img = zeros(200, 200);
img(75:125,75:125) = 255;
img = uint8(img);
imwrite(img,'square_sift.jpg');