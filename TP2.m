im = imread('./assets/photophore.tif');

imf = double(im);

figure('Name','moyen')
colormap(gray)
et = 5;
imb = imf + et*randn(size(imf));
subplot(2,2,1)
image(imf/4)
subplot(2,2,2)
image(imb/4)

flt1 = [1 1 1;1 1 1;1 1 1]/9;
flt2 = [1 1 1 1 1;1 1 1 1 1;1 1 1 1 1;1 1 1 1 1;1 1 1 1 1]/25;

imf1 = conv2(imb, flt1, 'same');
imf2 = conv2(imb, flt2, 'same');
subplot(2,2,3)
image(imf1/4);
subplot(2,2,4);
image(imf2/4);

[X,Y] = meshgrid(-1:1,-1:1);

sigma=5;

fgauss1 = exp(-(X.^2 + Y.^2)/(2*sigma*sigma));
fgauss1 = fgauss1/sum(sum(fgauss1))

[X,Y] = meshgrid(-1:3, -1:3)

fgauss2 = exp(-(X.^2 + Y.^2)/(2*sigma*sigma));
fgauss2 = fgauss2/sum(sum(fgauss2))

figure('Name','gauss')
colormap(gray)
subplot(2,2,1)
image(imf/4)
subplot(2,2,2)
image(imb/4)
subplot(2,2,3)
image(conv2(imb, fgauss1, 'same')/4)
subplot(2,2,4)
image(conv2(imb, fgauss2, 'same')/4)