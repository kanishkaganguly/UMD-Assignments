clear all;
close all;
clc;

% LEFT IMAGE %
imgL = imread('/img/car_left.jpg');
imgL = rgb2gray(imgL);
imgL = imresize(imgL,0.2);
imgL = single(imgL);
[fL,dL] = vl_sift(imgL);

% RIGHT IMAGE %
imgR = imread('/img/car_right.jpg');
imgR = rgb2gray(imgR);
imgR = imresize(imgR,0.2);
imgR = single(imgR);
[fR,dR] = vl_sift(imgR);

% [fR, fL, value] - Top 3 Entries %
match = find_best_match(dL, dR);
[color] = [[1 1 0];[1 0 0];[0 1 0]];

figure
imshow(uint8(imgR))
title('Right Image Matches');
hold on;
for i=1:3
    xR = fR(1, match(i,1));
    yR = fR(2, match(i,1));
    scatter(xR,yR,50,color(i,:));
    p1(1,i) = xR;
    p1(2,i) = yR;
end
hold off;

figure
imshow(uint8(imgL))
title('Left Image Matches');
hold on;
for i=1:3
    xL = fL(1, match(i,2));
    yL = fL(2, match(i,2));
    scatter(xL,yL,50,color(i,:));
    p2(1,i) = xL;
    p2(2,i) = yL;
end
hold off;

%AFFINE TRANSFORMATION %
A = affine_transformation(p1,p2);

% RANSAC %
match = ransac_match(dL,dR);
for i = 1:20
    xR = fR(1, match(i,1));
    yR = fR(2, match(i,1));
    xL = fL(1, match(i,2));
    yL = fL(2, match(i,2));
    sample_space(i,1) = xR;
    sample_space(i,2) = yR;
    sample_space(i,3) = xL;
    sample_space(i,4) = yL;
end

for i = 1:1000
    count = 0;
    dist_sum = 0;
    
    rand_val1 = randi([1, 20]);
    rand_val2 = randi([1, 20]);
    rand_val3 = randi([1, 20]);
    
    rand_p1 = [sample_space(rand_val1,1), sample_space(rand_val2,1), sample_space(rand_val3,1); sample_space(rand_val1,2), sample_space(rand_val2,2), sample_space(rand_val3,2)];
    rand_p2 = [sample_space(rand_val1,3), sample_space(rand_val2,3), sample_space(rand_val3,3); sample_space(rand_val1,4), sample_space(rand_val2,4), sample_space(rand_val3,4)];
    
    A = affine_transformation(rand_p1, rand_p2);
    for j = 1:20
        affine_points = A * [sample_space(j,1:2) 1]';
        P1 = affine_points';
        P2 = sample_space(j,3:4);
        distance = euclidean(P1, P2);
        if distance < 2
            count = count + 1;
            dist_sum = dist_sum + distance;
            map_count(i,1) = rand_val1;
            map_count(i,2) = rand_val2;
            map_count(i,3) = rand_val3;
            map_count(i,4) = count;
            map_count(i,5) = dist_sum;
        end
    end
end
% Remove zero rows & cols
map_count( all(~map_count,2), : ) = [];
map_count( :, all(~map_count,1) ) = [];

% Sort by largest count and smallest distance sum %
map_count = sortrows(map_count,[4,-5]);

% Obtain 3 points for best affine transform %
best_affine = map_count(end,:);
best_affine = best_affine(1:3);
affine_p1 = [sample_space(best_affine(1),1), sample_space(best_affine(2),1), sample_space(best_affine(3),1); sample_space(best_affine(1),2), sample_space(best_affine(2),2), sample_space(best_affine(3),2)];
affine_p2 = [sample_space(best_affine(1),3), sample_space(best_affine(2),3), sample_space(best_affine(3),3); sample_space(best_affine(1),4), sample_space(best_affine(2),4), sample_space(best_affine(3),4)];
T = affine_transformation(affine_p1, affine_p2);

stitch(imgL, imgR, T);