# Traitement d’image

 
## TP N° 1 : La transformée de Fourier


```matlab
imf = conv2(imb, fgauss3, 'same');
p = sqrt((1/(N*M))*(sum(sum((im - imf).^2))));
```


![](https://i.imgur.com/R53zwY7.png)



## TP N° 2 : 

```matlab
% avec
A = 50;
B = 10;
I = sin(2*pi*(A*x/256 + B*y/256)) + 1;
```
![](https://i.imgur.com/m79pNiN.png)

- Les pics fréquentiels de I : Localisés en (119,79) et (139,179)


![](https://i.imgur.com/VVwFS1A.png)


```matlab

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
```

Après l'application de la transformée de fourier inverse on se débarasse des perturbations appliquées

![](https://i.imgur.com/HxnVa1t.png)




## TP N° 3 :


* 1. Calcul du laplacien de l'image imlap par convolution avec un masque laplacien donné par :
``` matlab
lpmsk = [0 1 0 ; 1 -4 1 ; 0 1 0];
```

* 2. 
```matlab
function retval = laplaceS (img, seuil)
  imgd = double(img); #Ref non bruitée
  lpmsk = [0 1 0 ; 1 -4 1 ; 0 1 0];
  imglap = conv2(imgd, lpmsk, 'same');
  imgp = imglap > 0;
  # IL faut deux autres images décalées pour comparer le voisins
  # Des versions translatées d'un pixel par rapport à la première
  imgp1 = imgp(1:255, 1:255);
  imgph = imgp(1:255, 2:256);
  imgpv = imgp(2:256, 1:255);
  # Passage par 0
  imgZ = (imgp1~=imgph) | (imgp1~=imgpv);
  #imshow(imgZ)
  gx = [1 1 1; 0 0 0 ; -1 -1 -1];
  gy = gx';
  imgn = conv2(imgd, gx , 'same').^2 + conv2(imgd, gy, 'same').^2;
  imgn = imgn(1:255, 1:255);
  cont = imgZ & (imgn > seuil);
  retval =  cont;
endfunction
```



* Différence entre Canny( à gauche )  et Laplace avec le même seuil


![](https://i.imgur.com/BSE9nlW.png)


## TP N° 4 : 

* Avec la fonction otsu() fournie calculer l'image segmentée de nuageNDG.bmp. La fonction otsu()
s'applique simplement sur une image img de la façon suivante

```matlab
imb = otsu(img);
```
![](https://i.imgur.com/XgmEF3i.png)



- Pour dinstinguer le seuil, le choix de prendre des petits bout de nuage et de ciel est volontaire et sera montré dans la suite  :

![](https://i.imgur.com/6uo6SMT.png)


![](https://i.imgur.com/mEKbSZH.png)


* L'intersection est ainsi visible grâce à ces deux segmentations choisies

![](https://i.imgur.com/VaFsUVf.png)


* Conclusion :

![](https://i.imgur.com/Q5ynTmX.png)

Avec un seuil supervisé, le resultat est meilleur.




## TP N° 5 : Segmentation par attributs de texture

* 
* 1 - Afficher l'image normalisée entre 0 et 64. Qu'observe-t-on ? Conclusion.
   ![](https://i.imgur.com/ng0HWnv.png)
   Les niveaux de gris sont plus homogènes

* 2 - 
  * 2 - a. Calculer les valeurs moyennes des deux images attributs. Conclusion.
  
  ```matlab
  m_1 = mean(mean(texture1));
  m_2 = mean(mean(texture2));
  ```
  * 2 - b. Afficher les histogrammes des deux images attributs. On utilise pour cela la fonction hist(). Conclusion ?
  ![](https://i.imgur.com/uxZZKXx.png)
  
  
  ![](https://i.imgur.com/Ruz6lKV.png)
  
* 3 -
  * 3 - a. En utilisant la fonction otsu() fournie calculer l'image segmentée de texture3.tif
  * 3 - b. Segmentation supervisée. 
  * Calculer la valeur moyenne et l'écart type de l'attribut
  * Calculer l'image binaire par seuillage
  
  ![](https://i.imgur.com/TiDH6h9.png)
  ![](https://i.imgur.com/GqJVhEk.png)




## TP 6 :

*  Application du filtre avec un bruit Salt & Pepper, le résultat est surprenant 
![](https://i.imgur.com/g9Ooumf.png)


* Application du filtre avec un bruit gaussien : le bruit est simplement flouté par petites cases 
![](https://i.imgur.com/EUFXmQR.png)


