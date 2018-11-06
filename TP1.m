im = imread('./assets/photophore.tif');
#imshow(im)
#image(im/4);
#colormap(gray);
imf = double(im); #Ref non bruitée
et = 5;

imb = imf + et*randn(size(imf)); # En ajoutant uu bruit gaussien d'écart type et = 5

im = imf;

## Filtre Moyen
flt1 = ones(3)/9;
flt2 = ones(5)/25;

imf1 = conv2(im, flt1, 'same');
imf2 = conv2(im, flt2, 'same');
## Filtre Gaussien
[X3,Y3] = meshgrid(-1:1, -1:1); # Construit les masques X et Y
[X5,Y5] = meshgrid(-2:2, -2:2); # Construit les masques X et Y


sigma = 5;
# Construction d'un filtre normalisé
fgauss3 = exp(-(X3.^2 + Y3.^2)/(2*sigma*sigma));
fgauss5 = exp(-(X5.^2 + Y5.^2)/(2*sigma*sigma));
fgauss3 = fgauss3/sum(sum(fgauss3));
fgauss5 = fgauss5/sum(sum(fgauss5));

imf3 = conv2(im, fgauss3, 'same');
imf4 = conv2(im, fgauss5, 'same');



# Calcul des performances

[N,M] = size(im/4);
p1 = sqrt(1/N*M*(sum(sum((im - imf1).^2))));
p2 = sqrt(1/N*M*(sum(sum((im - imf2).^2))));
p3 = sqrt(1/N*M*(sum(sum((im - imf3).^2))));
p4 = sqrt(1/N*M*(sum(sum((im - imf4).^2))));


## Affichage
subplot(4,1,1);
image(imf1/4);
colormap(gray);
title(['Filtre moyen 3x Performance : ',num2str(p1)])

subplot(4,1,2);
image(imf2/4);
colormap(gray);
title(['Filtre moyen 5x Performance : ',num2str(p2)])

subplot(4,1,3);
image(imf3/4);
colormap(gray);
title(['Filtre gaussien 3x Performance : ',num2str(p3)])

subplot(4,1,4);
image(imf4/4);
colormap(gray);
title(['Filtre gaussien 5x Performance : ',num2str(p4)])

figure();
image(im/4);
colormap(gray);
title('Image de base');