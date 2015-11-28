function [ ssd ] = Q6_histDist( h1, h2 )
ssd_red = sum((h1(1,:)-h2(1,:)).^2);
ssd_green = sum((h1(2,:)-h2(2,:)).^2);
ssd_blue = sum((h1(3,:)-h2(3,:)).^2);
ssd = [ssd_red;ssd_green;ssd_blue];
end