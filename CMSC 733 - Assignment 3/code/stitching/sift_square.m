clear all;
close all;
clc;

img = imread('/img/square_sift.jpg');
img = single(img);

[f,d] = vl_sift(img) ;

figure
imshow(img)
display_sift_features(f)