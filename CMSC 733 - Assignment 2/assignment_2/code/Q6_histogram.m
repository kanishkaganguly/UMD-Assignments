clear all;
close all;
clc;

myDir = 'hist_img/';
ext_img = '*.jpg';
a = dir([myDir ext_img]);
nfile = max(size(a));
for i=1:nfile
    my_img1(i).img = imread([myDir a(i).name]);
    my_img2(i).img = imread([myDir a(i).name]);
end

for i=1:6
    for j=(i+1):6
        h1 = Q6_myColorHist(my_img1(i).img,0);
        h2 = Q6_myColorHist(my_img2(j).img,0);
        ssd = Q6_histDist(h1, h2);
        ssd_red_table(i,j) = ssd(1,:);
        ssd_green_table(i,j) = ssd(2,:);
        ssd_blue_table(i,j) = ssd(3,:);
        ssd_red_table(j,i) = ssd(1,:);
        ssd_green_table(j,i) = ssd(2,:);
        ssd_blue_table(j,i) = ssd(3,:);
    end
end

% Semantic Similarity In Percentages Between Images %
similarity = Q6_similarity(ssd_red_table,ssd_green_table, ssd_blue_table);

images_list = {'desert1', 'desert2', 'desert3', 'forest1', 'forest2', 'forest3'};
array2table(similarity, 'VariableNames', images_list, 'RowNames', images_list)
