function circle(x,y,r,handle)
ang=0:0.01:2*pi;
xp=r*cos(ang);
yp=r*sin(ang);
figure(handle);
plot(x+xp,y+yp);
end