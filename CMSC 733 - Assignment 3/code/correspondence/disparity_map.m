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