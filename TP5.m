clear all;
close all;
clear all function;

texture1 = imread('./assets/texture1.tif');
texture2 = imread('./assets/texture2.tif');
texture3 = imread('./assets/texture3.tif');

L5=[1 , 4 , 6 , 4 , 1]; %level  (Intensitaet)
E5=[-1, -2, 0 , 2 , 1]; %edge   (Kanten)
S5=[-1,  0, 2 , 0 ,-1]; %spot
R5=[1 , -4, 6 ,-4 , 1]; %ripple (Rauhheit)
W5=[-1, 2 , 0 , -2, 1]; %wave   (welligkeit)
L5S5=L5'*S5;



imf = conv2(texture3, L5S5, 'same');

subplot(1,2,1);
imagesc(texture3);
colormap(gray);
title('Image de base');
subplot(1,2,2);
imagesc(imf);
colormap(gray);
title('Image covoluée par le masque L5S5');

#vL = VarianceLocale(imf, 5);
imfc = imf - min(min(imf));
mn = min(imfc);
out = 64./(max(imf)-mn)*(imf - mn);
figure();
subplot(1,3,1);
##imagesc(out);
hist(imfc/599);

colormap(gray);
title('image convoluée');
figure();
subplot(1,3,2);
imagesc(imfc);
colormap(gray);


## 
m = mean(mean(texture3));
m_1 = mean(mean(texture1));
m_2 = mean(mean(texture2));



ec = sqrt(mean(var(texture3)));
ec_1 = sqrt(mean(var(texture1)));
ec_2 = sqrt(mean(var(texture2)));

figure();
plot(gaussmf((0:255), [ec_1 m_1]))
##legend('Texture1');
hold('on');
plot(gaussmf((0:255), [ec_2 m_2]))
##legend('Texture2');




# 106.25
figure();
imb  = otsu(texture3);
imbs = 1 + (texture3 > 106.25) ;
imagesc(imbs);
colormap(gray);





