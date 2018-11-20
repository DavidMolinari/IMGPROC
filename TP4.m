clear all;
close all;
clear all function;
img = imread('./assets/sunset.jpg');
[IDX,sep] = otsu(img, 2);


print(IDX);


