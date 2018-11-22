clear all;
close all;
clear all function;

img = imread('./assets/NUAGENDG.bmp');
imb = otsu(img);
subplot(1,2,1);
imagesc(img);
subplot(1,2,2);
imagesc(imb)
colormap(gray);
sub_img = img(50:150 , 60:180);
ngx = img(110:160, 120:150);

figure();

subplot(1,2,1);
imshow(sub_img);
title('Background');
subplot(1,2,2);
imshow(ngx);
title('Nuage');


figure();

vecc = (0:255);
subplot(1,3,1);
hist(reshape(img,1,size(img,1)*size(img,2)),vecc) ;
subplot(1,3,2);
hist(reshape(sub_img,1,size(sub_img,1)*size(sub_img,2)),vecc) ;
subplot(1,3,3);
hist(reshape(ngx,1,size(ngx,1)*size(ngx,2)),vecc) ;



m = mean(mean(img));
m_1 = mean(mean(sub_img));
m_2 = mean(mean(ngx));


ec = sqrt(mean(var(img)));
ec_1 = sqrt(mean(var(sub_img)));
ec_2 = sqrt(mean(var(ngx)));

#seuil = 1 / sqrt(2*pi*ec_1) * exp((-(img-m_2).^2))/2*ec_2.^2)

#ss(x) = (1 / (sqrt(2*pi*ec_2))) * exp((-(x-m)^2) / (2*ec_2^2));

figure();
plot(gaussmf((0:255), [ec_1 m_1]))
hold('on')
plot(gaussmf((0:255), [ec_2 m_2]))
title('On remarque que l"intersection est à 151, seuil à 151');
figure();
imgg = 1 + (img > 151);

subplot(1,2,1);
imagesc(imb);
colormap(gray);
title('Avec un seul non supervisé');
subplot(1,2,2);
imagesc(imgg);
colormap(gray);
title('Avec un seul supervisé');


