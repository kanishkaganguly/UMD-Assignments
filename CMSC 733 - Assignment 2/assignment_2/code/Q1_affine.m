clear all
close all
clc

img = imread('lena.jpg');
figure
imshow(img);
title('Original Image');

[rows, cols] = size(img);

T = [1.9 -0.5 0; 0 0 1; 1 1 1] * [1 -1 0; 0 0 3; 1 1 1]^-1

% Affine - Nearest Neighbour %
new_img = zeros(rows,cols);

for i = 1:rows
    for j = 1:cols
        coord = T(1:2,1:2)*[i;j];
        x_2 = round(coord(1));
        y_2 = round(coord(2));
        
        if(x_2 > 0 && x_2 < rows && y_2 > 0 && y_2 < cols)
            new_img(i,j) = img(x_2,y_2);
        end
    end
end
affine_img = uint8(new_img);
figure
imshow(affine_img);
title('Nearest Neighbour Affine');

% Affine - Bilinear %
new_img2 = zeros(rows,cols);

for i = 1:rows
    for j = 1:cols
        coord = T(1:2,1:2)*[i;j];
        x = coord(1);
        y = coord(2);
        
        x1 = floor(x);
        y1 = floor(y);
        x2 = ceil(x);
        y2 = ceil(y);
        
        if(x1 > 0 && x2 > 0 && y1 > 0 && y2 > 0 && x1 < rows && y1 < cols && x2 < rows && y2 < cols)
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
affine_img2 = uint8(new_img2);
figure
imshow(affine_img2);
title('Bilinear Affine');