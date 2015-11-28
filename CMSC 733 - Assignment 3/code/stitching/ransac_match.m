function [match] = ransac_match(L1, L2)

[~, cols1] = size(L1);
[~, cols2] = size(L2);
match = zeros(cols2,3);

for i = 1:cols2
    for j = 1:cols1
        ssd = sum((L2(:,i)-L1(:,j)).^2);
        if j == 1
            match(i,1) = i;
            match(i,2) = j;
            match(i,3) = ssd;
        else
            if ssd < match(i,3)
                match(i,1) = i;
                match(i,2) = j;
                match(i,3) = ssd;
            end
        end
    end
end
match = sortrows(match, 3);
match = match(1:20,:);
end