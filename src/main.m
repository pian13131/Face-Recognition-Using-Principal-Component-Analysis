clc;
clear;

row = 193;
col = 162;
N = 10;
path = '../facedata/';
t_set = zeros(row*col, N);
for i = 1:N
    path_face = [path, mat2str(i), 'a.jpg'];
    img = imread(path_face);
    t_set(:,i) = reshape(img',row*col,1);
end
cov = t_set - mean(t_set);
[eig_vec, eig_val] = eig(cov'*cov); 
for i = 1:N
   if eig_val(i:i) < 1000
       eig_vec(:,i) = 0;
   end
end
eig_face = cov * eig_vec;