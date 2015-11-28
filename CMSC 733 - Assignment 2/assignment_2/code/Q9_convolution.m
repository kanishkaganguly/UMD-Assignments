clear all;
close all;
clc;

h_x = -5:0.01:5;
k = size(h_x);
h_y = zeros(1,k(2));
for i = 1:k(2)
    if h_x(i) >= -0.5 && h_x(i) <=0.5
        h_y(i) = 1;
    else
        h_y(i) = 0;
    end
end
figure
subplot(4,1,1)
plot(h_x,h_y)
axis([-5,5,0,1.5])
title('h(x)');

f_x = 5:0.01:25;
k = size(f_x);
f_y = zeros(1,k(2));
for i = 1:k(2)
    if f_x(i) >= 10 && f_x(i) <= 20
        f_y(i) = 1;
    else
        f_y(i) = 0;
    end
end
subplot(4,1,2)
plot(f_x,f_y)
axis([5,25,0,1.5])
title('f(x)');

hf_y = convn(h_y, f_y);
subplot(4,1,3);
plot(hf_y);
title('h(x)*f(x)');

hh_y = convn(h_y, h_y);
subplot(4,1,4);
plot(hh_y);
title('h(x)*h(x)');