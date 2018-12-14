function [] = reconstruct(n,type,pca_n)
global mean_face eig_face row col path;
ef = eig_face(:,1:pca_n);
path_face = [path, mat2str(n), type,'.jpg'];
test_face = imread(path_face);
test_face_vec = reshape(test_face,row*col,1);
test_face_vec = double(test_face_vec);
test_face_vec = ef*ef'*(test_face_vec - mean_face) + mean_face;
res_face = reshape(test_face_vec,row,col);
imshow(mat2gray(res_face));
title(['Reconstruct Face PCs = ', mat2str(pca_n)]);
end

