clear all
close all
clc

img = imread('lena.jpg');
figure
imshow(img);
title('Original Image');

[rows, cols] = size(img);

center_x = rows/2;
center_y = cols/2;

% Rotation Nearest Neighbour %
new_img = zeros(rows);
angle = 15;
for i = 1:rows
    for j = 1:cols
        x = cosd(angle) * (i-center_x) - sind(angle)*(j-center_y) + center_x;
        y = sind(angle) * (i-center_x) + cosd(angle)*(j-center_y) + center_y;
        x_2 = round(x);
        y_2 = round(y);
        
        if (x_2 > cols || x_2 < 1)
            continue
        elseif(y_2 > rows || y_2 < 1)
            continue
        else
            new_img(i,j) = img(x_2,y_2);
        end
    end
end
rot_img = uint8(new_img);

% Rotation Bilinear %
angle = 15;
new_img2 = zeros(rows);
for i = 1:rows
    for j = 1:cols
        x = cosd(angle) * (i-center_x) - sind(angle)*(j-center_y) + center_x;
        y = sind(angle) * (i-center_x) + cosd(angle)*(j-center_y) + center_y;
        
        x1 = floor(x);
        y1 = floor(y);
        x2 = ceil(x);
        y2 = ceil(y);
        
        if(x1 > cols || x1 < 1)
            continue
        elseif(x2 > cols || x2 < 1)
            continue
        elseif(y1 > cols || y1 < 1)
            continue
        elseif(y2 > cols || y2 < 1)
            continue
        else
            I1 = (x-x1)*img(x2,y1);
            I2 = (x2-x)*img(x1,y1);
            I1_ = I1 + I2;
            
            I1 = (x-x1)*img(x2,y2);
            I2 = (x2-x)*img(x1,y2);
            I2_ = I1 + I2;
            
            I = (y-y1)*I2_ + (y2-y)*I1_;
            new_img2(i,j) = I;
        end
    end
end
rot_img2 = uint8(new_img2);

figure
subplot(1,2,1)
imshow(rot_img);
title('Nearest Neighbour Rotation');
subplot(1,2,2)
imshow(rot_img2);
title('Bilinear Rotation');