clear all;
close all;
clc;

img = imread('lena.jpg');
scaling_constant = 0.7;

% Standard Kernel Size %
box = imboxfilt(img,3);
gauss = imgaussfilt(img,2);

img_box_subtract = img - box;
img_gauss_subtract = img - gauss;

img_box_sharpen = img + (scaling_constant * img_box_subtract);
img_gauss_sharpen = img + (scaling_constant * img_gauss_subtract);

figure
subplot(1,2,1)
imshow(img)
title('Original Image')
subplot(1,2,2)
imshow(img_box_sharpen)
title('Box Sharpened Image')

figure
subplot(1,2,1)
imshow(img)
title('Original Image')
subplot(1,2,2)
imshow(img_gauss_sharpen)
title('Gaussian Sharpened Image')

clear all;
close all;
clc;
img = imread('lena.jpg');
scaling_constant = 0.7;

% Increased Kernel Size %
box = imboxfilt(img,7);
gauss = imgaussfilt(img,4);

img_box_subtract = img - box;
img_gauss_subtract = img - gauss;

img_box_sharpen = img + (scaling_constant * img_box_subtract);
img_gauss_sharpen = img + (scaling_constant * img_gauss_subtract);

figure
subplot(1,2,1)
imshow(img)
title('Original Image')
subplot(1,2,2)
imshow(img_box_sharpen)
title('Box Sharpened Image')

figure
subplot(1,2,1)
imshow(img)
title('Original Image')
subplot(1,2,2)
imshow(img_gauss_sharpen)
title('Gaussian Sharpened Image')