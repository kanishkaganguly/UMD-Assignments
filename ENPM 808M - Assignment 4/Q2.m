start_pt = [0 0];
end_pt = [10 0];
obstacle1 = [5;0];
obstacle2 = [2.5;3];
obstacle3 = [7.5;-3];

warehouse = figure;
title('Warehouse - Visual Representation');
axis([-5,30,-10,30]);
daspect([1 1 1]);
hold on;
circle(obstacle1(1),obstacle1(2),1.5,warehouse);
line([5 5],[0 20]);
str1 = 'Obstacle 1 \rightarrow';
text(5,20,str1,'HorizontalAlignment','right')

circle(obstacle2(1),obstacle2(2),1.9,warehouse);
line([2.5 2.5],[3 15]);
str2 = 'Obstacle 2 \rightarrow';
text(2.5,15,str2,'HorizontalAlignment','right')

circle(obstacle3(1),obstacle3(2),1.5,warehouse);
line([7.5 7.5],[-3 25]);
str3 = '\leftarrow Obstacle 3';
text(7.5,25,str3)

scatter(start_pt(1),start_pt(2));
line([0 0],[0 10]);
str4 = 'Start \rightarrow';
text(0,10,str4,'HorizontalAlignment','right')

scatter(end_pt(1),end_pt(2));
line([10 10],[0 5]);
str5 = '\leftarrow End';
text(10,5,str5)
hold off;