im = imread('./assets/photophore.tif');
#imshow(im)
#image(im/4);
#colormap(gray);
imgd = double(im); #Ref non bruitée



# calcul du laplacien de l'image 
lpmsk = [0 1 1 ; 1 -4 1 ; 0 1 0];
imglap = conv2(imgd, lpmsk, 'same');

colormap(gray);
#image(imglap/4)

# carte de polarité comparé l'image à 0

imgp = imglap > 0;


# IL faut deux autres images décalées pour comparer le voisins
# Des versions translatées d'un pixel par rapport à la première
imgp1 = imgp(1:255, 1:255);
imgph = imgp(1:255, 2:256);
imgpv = imgp(2:256, 1:255);

# Passage par 0
imgZ = (imgp1~=imgph) | (imgp1~=imgpv)
#imshow(imgZ)

gx = [1 1 1; 0 0 0 ; -1 -1 -1];

gy = gx';


imgn = conv2(imgd, gx , 'same').^2 + conv2(imgd, gy, 'same').^2;
imgn = imgn(1:255, 1:255);
cont = imgZ & (imgn > 100);
imshow(cont);