%% START MATCHING %%
img1 = imresize(imread('multi\img2.png'),0.7);
img2 = imresize(imread('multi\img3.png'),0.7);
img3 = imresize(imread('multi\img4.png'),0.7);
img4 = imresize(imread('multi\img5.png'),0.7);

stitched_img1 = zeros();
outimg1 = stitch2(stitched_img1, img1, img2);

stitched_img2 = zeros();
outimg2 = stitch2(stitched_img2, img2, img3);

stitched_img3 = zeros();
outimg3 = stitch2(stitched_img3, img3, img4);

stitched_img = zeros();
outimg = stitch2(stitched_img, outimg1, outimg2);
outimg = stitch2(stitched_img, outimg, outimg3);

%outimg = stitch2(stitched_img, outimg, img3);
%outimg = stitch2(stitched_img, outimg, img4);

%{
for a = 1:img_no-1
    % READ 2 IMAGES %
    filename = ['multi\' 'img' num2str(a) '.png'];
    imgL = imread(filename);
    filename = ['multi\' 'img' num2str(a+1) '.png'];
    imgR = imread(filename);
end
%}