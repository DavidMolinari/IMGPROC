# Traitement d’image

 
## TP N° 1 : La transformée de Fourier


```matlab
imf = conv2(imb, fgauss3, 'same');
p = sqrt((1/(N*M))*(sum(sum((im - imf).^2))));
```


![](https://i.imgur.com/R53zwY7.png)





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



//WONTFIX


![](https://i.imgur.com/zFJ3dbw.png)

![](https://i.imgur.com/lamQz9N.png)

![](https://i.imgur.com/gANVkTr.png)
