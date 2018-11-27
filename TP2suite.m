clear all;
close all;
clear all function;
[x,y] = meshgrid(1:256, 1:256);

A = 50;
B = 10;

im = imread('./assets/photophore.tif');
imf = double(im);

I = sin(2*pi*(A*x/256 + B*y/256)) + 1;
imshow(I);
ii = fft2(I);
figure();
#ii = fftshift(ii);
ii= abs(ii);
imshow(ii);

figure();
#image((ii)/4);
colormap(gray);

img = fft2(im + I);

figure();
imgOld = fft2(im + I);
img(11,51) = 0;
img(247,207) = 0;
imgOld = fftshift(imgOld);
img = fftshift(img);


figure();
subplot(1,2,1);
imgIOld = ifft2(imgOld);
imagesc((abs(imgIOld))/4);

imgI = ifft2(img);
subplot(1,2,2);
image((abs(imgI))/4);
colormap(gray);
