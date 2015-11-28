clc;

% LEFT TSUKUBA %
imgL = imread('/img/tsukuba_left1.ppm');
imgL = rgb2gray(imgL);
imgL = mat2gray(imgL); % Normalize Image %
[rowL, colL] = size(imgL);

% RIGHT TSUKUBA %
imgR = imread('/img/tsukuba_right1.ppm');
imgR = rgb2gray(imgR);
imgR = mat2gray(imgR); % Normalize Image %
[rowR, colR] = size(imgR);

OC = 0.01; % Occlusion Cost %

% INITIALIZE C Table %
C = zeros(colL+1, colR+1, rowL);

for m = 1:rowL
    for i = 1:colL+1
        for j = 1:colR+1
            C(1,1,m) = 0;
            C(i,1,m) = (i-1) * OC;
            C(1,j,m) = (j-1) * OC;
        end
    end
end

% FILL C Table %
for m = 1:rowL
    for i = 2:colL+1
        for j = 2:colR+1
            C(i,j,m) = min([(imgL(m,i-1)-imgR(m,j-1))^2 + C(i-1,j-1,m), OC + C(i,j-1,m), OC + C(i-1,j,m)]);
        end
    end
end

% INITIALIZE M Table %
M = ones(colL, colR, rowL)*-1;

% FILL M Table %
for m = 1:rowL
    i = 2;
    j = 2;
    M(1,1,m) = 1;
    while (i < colL+1 && j < colR+1)
        if i > j
            if C(i,j+1,m) <= C(i+1,j+1,m) && C(i,j+1,m) <= C(i+1,j,m)
                M(i-1,j,m) = 3;
                j = j+1;
            elseif C(i+1,j+1,m) <= C(i+1,j,m) && C(i+1,j+1,m) <= C(i,j+1,m)
                M(i,j,m) = 1;
                i = i+1;
                j = j+1;
            else
                M(i,j-1,m) = 2;
                i = i+1;
            end
        else
            if C(i+1,j,m) < C(i+1,j+1,m)
                M(i,j-1,m) = 2;
                i = i+1;
            else
                M(i,j,m) = 1;
                i = i+1;
                j = j+1;
            end
        end
    end
end

% INITIALIZE D Table %
D = zeros(rowL, colL);

% CREATING DISPARITY MAP %
for m = 1:rowL
    for i = 1:colL
        for j = 1:colR
            if M(i,j,m) == 1
                D(m,i) = i-j;
            end
        end
    end
end

% Final Image %
D_t = D/max(max(D));
D_t = round(D_t*255);
imshow(uint8(D_t))