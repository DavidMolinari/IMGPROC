clear all;
close all;
clear all function;
im = imread('./assets/photophore.tif');
im = double(im);
imgL = laplaceS(im,  1000);
bruit = im + 0.05 * randn(size(im));


seuil = 5;
refcanny = canny(im,1,1,seuil) ;

imshow(refcanny);

canny05 =  canny(bruit,1,1,seuil) ;
figure();
imshow(canny05);
tauxCanny05 = sum(sum(refcanny ~= canny05));


%%%
seuilPla = 230;
reflapla = laplaceS(im, seuil);

lapla05 = laplaceS(bruit,seuilPla);
tauxLaPla05 = sum(sum(reflapla ~= lapla05));


imshow(refcanny);
imshow(reflapla);
