clear all;
close all;
clc;

img = zeros(500, 500);
img(100:200,100) = 255;
img(100:200,300) = 255;
img(100,100:300) = 255;
img(200,100:300) = 255;
img_show = uint8(img);

figure
subplot(3,2,[1,2])
subimage(img_show)
set(gca,'XtickLabel',[],'YtickLabel',[]);
title('Original Image');

top_left_mask = [0 0 0 0 0; 0 0 0 0 0; 0 0 1 1 1; 0 0 1 0 0; 0 0 1 0 0];
top_right_mask = [0 0 0 0 0; 0 0 0 0 0; 1 1 1 0 0; 0 0 1 0 0; 0 0 1 0 0];
bottom_left_mask = [0 0 1 0 0; 0 0 1 0 0; 0 0 1 1 1; 0 0 0 0 0; 0 0 0 0 0];
bottom_right_mask = [0 0 1 0 0; 0 0 1 0 0; 1 1 1 0 0; 0 0 0 0 0; 0 0 0 0 0];

[rows, cols] = size(img);

baseline = 0;

for i=1:rows
    for j=1:cols
        if(i == 1 && j == 1)
            edge = bsxfun(@times,img(i:i+4,j:j+4),top_left_mask);
            baseline = edge(3,3);
        end
        if i+4 < rows && j+4 < cols
            edge = bsxfun(@times,img(i:i+4,j:j+4),top_left_mask);
            if edge(3,3) == edge(3,4)
                if edge(3,4) == edge(3,5)
                    if edge(3,5) == edge(4,3)
                        if edge(4,3) == edge(5,3)
                            if(edge(3,3) ~= baseline)
                                img(i+2,j+2) = 0;
                                break;
                            else
                                continue;
                            end
                        end
                    end
                end
            end
        end
    end
end
img_show = uint8(img);
subplot(3,2,3)
subimage(img_show)
set(gca,'XtickLabel',[],'YtickLabel',[]);
title('Top Left Corner Detected');

img = zeros(500, 500);
img(100:200,100) = 255;
img(100:200,300) = 255;
img(100,100:300) = 255;
img(200,100:300) = 255;

for i=1:rows
    for j=1:cols
        if(i == 1 && j == 1)
            edge = bsxfun(@times,img(i:i+4,j:j+4),top_right_mask);
            baseline = edge(3,3);
        end
        if i+4 < rows && j+4 < cols
            edge = bsxfun(@times,img(i:i+4,j:j+4),top_right_mask);
            if edge(3,3) == edge(3,2)
                if edge(3,2) == edge(3,1)
                    if edge(3,1) == edge(4,3)
                        if edge(4,3) == edge(5,3)
                            if(edge(3,3) ~= baseline)
                                img(i+2,j+2) = 0;
                                break;
                            else
                                continue;
                            end
                        end
                    end
                end
            end
        end
    end
end
img_show = uint8(img);
subplot(3,2,4)
subimage(img_show)
set(gca,'XtickLabel',[],'YtickLabel',[]);
title('Top Right Corner Detected');

img = zeros(500, 500);
img(100:200,100) = 255;
img(100:200,300) = 255;
img(100,100:300) = 255;
img(200,100:300) = 255;

for i=1:rows
    for j=1:cols
        if(i == 1 && j == 1)
            edge = bsxfun(@times,img(i:i+4,j:j+4),top_right_mask);
            baseline = edge(3,3);
        end
        if i+4 < rows && j+4 < cols
            edge = bsxfun(@times,img(i:i+4,j:j+4),bottom_left_mask);
            if edge(3,3) == edge(2,3)
                if edge(2,3) == edge(1,3)
                    if edge(1,3) == edge(3,4)
                        if edge(3,4) == edge(3,5)
                            if(edge(3,3) ~= baseline)
                                img(i+2,j+2) = 0;
                                break;
                            else
                                continue;
                            end
                        end
                    end
                end
            end
        end
    end
end
img_show = uint8(img);
subplot(3,2,5)
subimage(img_show)
set(gca,'XtickLabel',[],'YtickLabel',[]);
title('Bottom Left Corner Detected');
figure
imshow(img_show)

img = zeros(500, 500);
img(100:200,100) = 255;
img(100:200,300) = 255;
img(100,100:300) = 255;
img(200,100:300) = 255;

for i=1:rows
    for j=1:cols
        if(i == 1 && j == 1)
            edge = bsxfun(@times,img(i:i+4,j:j+4),bottom_right_mask);
            baseline = edge(3,3);
        end
        if i+4 < rows && j+4 < cols
            edge = bsxfun(@times,img(i:i+4,j:j+4),bottom_right_mask);
            if edge(3,3) == edge(3,2)
                if edge(3,2) == edge(3,1)
                    if edge(3,1) == edge(2,3)
                        if edge(2,3) == edge(1,3)
                            if(edge(3,3) ~= baseline)
                                img(i+2,j+2) = 0;
                                break;
                            else
                                continue;
                            end
                        end
                    end
                end
            end
        end
    end
end
img_show = uint8(img);
subplot(3,2,6)
subimage(img_show)
set(gca,'XtickLabel',[],'YtickLabel',[]);
title('Bottom Right Corner Detected');
figure
imshow(img_show)