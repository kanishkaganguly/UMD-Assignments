function [ affine ] = affine_transformation(p1, p2)
p1 = [p1;ones(1,3)];
affine = p2 * inv(p1);
end

