function [stitched_out] = stitch( J, K, H )

offset = 20;

[J_rows, J_cols] = size(J);
[K_rows, K_cols] = size(K);

stitchedImg = J;
stitchedImg = padarray(stitchedImg,[100, 100], 0, 'post');
[s_rows, s_cols] = size(stitchedImg);
shiftedImg = zeros(s_rows, s_cols);

for o = 1:s_rows
    for p = 1:s_cols
        shiftedImg(o+offset,p+offset) = stitchedImg(o, p);
    end
end
stitchedImg = shiftedImg;

for i = 1:K_rows
    for j = 1:K_cols
        affined_point = H * [j;i;1];
        affined_point = round(affined_point);
        if affined_point(1) <= J_cols &&  affined_point(2) <= J_rows
            fprintf('%d %d\n',affined_point(2),affined_point(1));
            continue
        elseif affined_point(1) <= 0 && affined_point(2) <= 0
            fprintf('%d %d\n',affined_point(2),affined_point(1));
            continue
        else
            fprintf('%d %d\n',affined_point(2),affined_point(1));
            stitchedImg(affined_point(2)+offset,affined_point(1)+offset) = K(i,j);
        end
    end
end
stitched_out = stitchedImg;


[stitched_rows, stitched_cols] = size(stitchedImg);
black_row = zeros(1,stitched_rows);
black_col = zeros(1,stitched_cols);

for k = 1:stitched_rows
    if isequal(stitchedImg(k,:),black_row) == 1
        stitchedImg(k,:) = [];
    end
end
for l = 1:stitched_cols
    if isequal(stitchedImg(:,l),black_col) == 1
        stitchedImg(:,l) = [];
    end
end
end