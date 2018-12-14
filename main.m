clc;
clear;
global mean_face eig_face row col path;
row = 193;
col = 162;
N = 190;
path = './facedata/';
% Compute the principal components %
t_set = zeros(row*col, N);
for i = 1:N
    path_face = [path, mat2str(i), 'a.jpg'];
    img = imread(path_face);
    t_set(:,i) = reshape(img,row*col,1);
end
mean_face = mean(t_set,2);
cov = t_set - mean_face;
[eig_vec, eig_val] = eig(cov'*cov);
eig_face = normc(cov * eig_vec);

% Reconstruct one of 190 individuals? neutral expression image %
figure;
subplot(2,2,1);
reconstruct(1,'a',10);
subplot(2,2,2);
reconstruct(1,'a',50);
subplot(2,2,3);
reconstruct(1,'a',120);
subplot(2,2,4);
reconstruct(1,'a',190);
% Reconstruct one of 190 individuals? smiling expression image %
figure;
subplot(2,2,1);
reconstruct(1,'b',10);
subplot(2,2,2);
reconstruct(1,'b',50);
subplot(2,2,3);
reconstruct(1,'b',120);
subplot(2,2,4);
reconstruct(1,'b',190);
% Reconstruct one of the other 10 individuals? neutral expression image %
figure;
subplot(2,2,1);
reconstruct(200,'a',10);
subplot(2,2,2);
reconstruct(200,'a',50);
subplot(2,2,3);
reconstruct(200,'a',120);
subplot(2,2,4);
reconstruct(200,'a',190);
% Use other non-human image %
figure;
reconstruct(777,'a',190);
% Rotate one of 190 individuals? neutral expression 
% image with different degrees 
path_face = [path,'1a.jpg'];
I = imread(path_face);
angle = [0, 45, 90, 180];
for i = 1:4
test_face = imrotate(I, angle(i), 'crop');
test_face_vec = reshape(test_face,row*col,1);
test_face_vec = double(test_face_vec);
test_face_vec = eig_face*eig_face'*(test_face_vec - mean_face) + mean_face;
res_face = reshape(test_face_vec,row,col);

subplot(2,2,i);
imshow(mat2gray(res_face));
title(['Reconstruct Face angle = ', mat2str(angle(i))]);
end