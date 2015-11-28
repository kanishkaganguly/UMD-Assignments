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