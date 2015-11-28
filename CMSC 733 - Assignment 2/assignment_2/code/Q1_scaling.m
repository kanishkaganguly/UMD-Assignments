clear all
close all
clc

img = imread('lena.jpg');

[rows, cols] = size(img);

scale = 3;
scale_mat = ([scale 0; 0 scale]^-1);
rows = round(rows * scale);
cols = round(cols * scale);

% Scaling - Nearest Neighbour %
new_img = zeros(rows,cols);

for i = 1:rows
    for j = 1:cols
        coord = scale_mat*[i;j];
        x_2 = round(coord(1));
        y_2 = round(coord(2));
        
        if(x_2 > 0 && y_2 > 0)
            new_img(i,j) = img(x_2,y_2);
        end
    end
end
scale_img = uint8(new_img);

% Scaling Bilinear %
new_img2 = zeros(rows,cols);

for i = 1:rows
    for j = 1:cols
        coord = scale_mat*[i;j];
        x = coord(1);
        y = coord(2);
        
        x1 = floor(x);
        y1 = floor(y);
        x2 = ceil(x);
        y2 = ceil(y);
        
        if(x1 > 0 && x2 > 0 && y1 > 0 && y2 > 0)
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
scale_img2 = uint8(new_img2);

figure
imshow(scale_img);
title('Nearest Neighbour Scaling by 3');

figure
imshow(scale_img2);
title('Bilinear Scaling by 3');
