## Copyright (C) 2018 Davvm
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} laplaceS (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Davvm <Davvm@DQV>
## Created: 2018-11-20

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
