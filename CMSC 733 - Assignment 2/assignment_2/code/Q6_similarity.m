function [ similarity ] = Q6_similarity( ssd_red, ssd_green, ssd_blue )

ssd_red_percent = 1 - ssd_red;
ssd_green_percent = 1 - ssd_green;
ssd_blue_percent = 1 - ssd_blue;

similarity = bsxfun(@times, ssd_blue_percent, bsxfun(@times, ssd_red_percent, ssd_green_percent));
similarity = similarity * 100;
end

