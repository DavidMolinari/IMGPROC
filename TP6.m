im = imread('./assets/photophore.tif');
imb = medfilt2(im, [3 3]);

I = imread('./assets/photophore.tif');
J = imnoise(I,'gaussian',0.02);
J_2 = imnoise(I,'salt & pepper',0.02);

K = medfilt2(J, [3 3]);



%% A
subplot(1,3,1);
imshow(I);
colormap(gray);
title('Image de base');
subplot(1,3,2);
imshow(J);
colormap(gray);
title('Image bruitée');
subplot(1,3,3);
imshow(K);
colormap(gray);
title('Application du filtre par la méthode mediane');

X = mat2gray(im);
X = im2double(X);

%%%% 

%% Pour r ´ealiser un filtrage lin ´eaire, il faut d’abord d ´efinir le masque h
%%`a utiliser. Pour cela, soit on le d´efinit de fa¸con analytique, soit on utilise la fonction fspecial de MATLAB
% Methodes analytiques
h = ones(3,3)/9;
% Filtre moyenneur de taille 3 x 3
h = [1 0 1 ; 0 2 0 ; 1 0 1]/6;
% Filtre ad hoc
% Methodes en utilisant fspecial
h = fspecial('average',[3 3]);
% Filtre moyenneur de taille 3 x 3
h = fspecial('gaussian',[15 15],1);
% Filtre gaussien de taille 15 x 15
% et d'ecart type 1
% On r ´ealise ensuite le filtrage de l’image grace `a la commande imfilter :
% X : image renormalisee (valeurs entre 0 et 1)
% h : masque de convolution
Y = imfilter(X,h,'replicate');
# Le filtrage non-lin ´eaire que nous allons consid ´erer ici es t le filtrage m ´edian, qui peut ˆetre realis ´e grace `a la commande medfilt2 :
% X : image renormalisee (valeurs entre 0 et 1)
Y = medfilt2(X,[3 3]);
% Filtrage median de taille 3 x 3

figure();
subplot(1,2,1);
imshow(Y);
title('Filtrage median de taille 3 x 3');
subplot(1,2,2);
imshow(X);
title("Image normalisée 0 1");

