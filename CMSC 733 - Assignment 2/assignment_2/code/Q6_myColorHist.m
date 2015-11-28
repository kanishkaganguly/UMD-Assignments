function [ hist ] = Q6_myColorHist( img, show_hist )
[rows, cols] = size(img);

img_red = img(:,:,1);
img_green = img(:,:,2);
img_blue = img(:,:,3);

bin_red = zeros(1,8);
bin_green = zeros(1,8);
bin_blue = zeros(1,8);

for(i=1:rows)
    for(j=1:cols/3)
        if(img_red(i,j) >= 1 && img_red(i,j) <= 32)
            bin_red(1) = bin_red(1) + 1;
        elseif(img_red(i,j) >= 33 && img_red(i,j) <= 64)
            bin_red(2) = bin_red(2) + 1;
        elseif(img_red(i,j) >= 65 && img_red(i,j) <= 96)
            bin_red(3) = bin_red(3) + 1;
        elseif(img_red(i,j) >= 97 && img_red(i,j) <= 128)
            bin_red(4) = bin_red(4) + 1;
        elseif(img_red(i,j) >= 129 && img_red(i,j) <= 160)
            bin_red(5) = bin_red(5) + 1;
        elseif(img_red(i,j) >= 161 && img_red(i,j) <= 192)
            bin_red(6) = bin_red(6) + 1;
        elseif(img_red(i,j) >= 193 && img_red(i,j) <= 224)
            bin_red(7) = bin_red(7) + 1;
        elseif(img_red(i,j) >= 225 && img_red(i,j) <= 255)
            bin_red(8) = bin_red(8) + 1;
        end
    end
end

for(i=1:rows)
    for(j=1:cols/3)
        if(img_green(i,j) >= 1 && img_green(i,j) <= 32)
            bin_green(1) = bin_green(1) + 1;
        elseif(img_green(i,j) >= 33 && img_green(i,j) <= 64)
            bin_green(2) = bin_green(2) + 1;
        elseif(img_green(i,j) >= 65 && img_green(i,j) <= 96)
            bin_green(3) = bin_green(3) + 1;
        elseif(img_green(i,j) >= 97 && img_green(i,j) <= 128)
            bin_green(4) = bin_green(4) + 1;
        elseif(img_green(i,j) >= 129 && img_green(i,j) <= 160)
            bin_green(5) = bin_green(5) + 1;
        elseif(img_green(i,j) >= 161 && img_green(i,j) <= 192)
            bin_green(6) = bin_green(6) + 1;
        elseif(img_green(i,j) >= 193 && img_green(i,j) <= 224)
            bin_green(7) = bin_green(7) + 1;
        elseif(img_green(i,j) >= 225 && img_green(i,j) <= 255)
            bin_green(8) = bin_green(8) + 1;
        end
    end
end

for(i=1:rows)
    for(j=1:cols/3)
        if(img_blue(i,j) >= 1 && img_blue(i,j) <= 32)
            bin_blue(1) = bin_blue(1) + 1;
        elseif(img_blue(i,j) >= 33 && img_blue(i,j) <= 64)
            bin_blue(2) = bin_blue(2) + 1;
        elseif(img_blue(i,j) >= 65 && img_blue(i,j) <= 96)
            bin_blue(3) = bin_blue(3) + 1;
        elseif(img_blue(i,j) >= 97 && img_blue(i,j) <= 128)
            bin_blue(4) = bin_blue(4) + 1;
        elseif(img_blue(i,j) >= 129 && img_blue(i,j) <= 160)
            bin_blue(5) = bin_blue(5) + 1;
        elseif(img_blue(i,j) >= 161 && img_blue(i,j) <= 192)
            bin_blue(6) = bin_blue(6) + 1;
        elseif(img_blue(i,j) >= 193 && img_blue(i,j) <= 224)
            bin_blue(7) = bin_blue(7) + 1;
        elseif(img_blue(i,j) >= 225 && img_blue(i,j) <= 255)
            bin_blue(8) = bin_blue(8) + 1;
        end
    end
end

% Normalization Stage %
sum_red = sum(bin_red);
bin_red = bin_red/sum_red;
sum_green = sum(bin_green);
bin_green = bin_green/sum_green;
sum_blue = sum(bin_blue);
bin_blue = bin_blue/sum_blue;
hist = [bin_red;bin_green;bin_blue];

% Histogram Visualization %
if show_hist == 1
    hist_plot=figure('Position', [100, 100, 3000, 3000]);
    subplot(1,3,1)
    bar(bin_red)
    set(gca,'XTickLabel',{'1-32', '33-64', '65-96', '97-128','129-160', '161-192', '193-224', '225-255'},'FontSize',8)
    title('Red Channel Histogram')
    xlabel('Intensity')
    ylabel('Pixel Count')
    
    subplot(1,3,2)
    bar(bin_green)
    set(gca,'XTickLabel',{'1-32', '33-64', '65-96', '97-128','129-160', '161-192', '193-224', '225-255'},'FontSize',8)
    title('Green Channel Histogram')
    xlabel('Intensity')
    ylabel('Pixel Count')
    
    subplot(1,3,3)
    bar(bin_blue)
    set(gca,'XTickLabel',{'1-32', '33-64', '65-96', '97-128','129-160', '161-192', '193-224', '225-255'},'FontSize',8)
    title('Blue Channel Histogram')
    xlabel('Intensity')
    ylabel('Pixel Count')
end
end