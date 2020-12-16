clear;clc;

%morfologie - pracowanie z ksztaltem obiektow binarnych 
im = double (imread('kaczki.jpg'))/255;
% imshow(im);
gim = rgb2gray(im);
bim = ~imbinarize(gim,.61);
subplot(1,2,1);
% imshow(gim);
% subplot(1,2,2);
% imshow(bim);

%korzystamy z operacji zamknieca
bim = imclose(bim,ones(7));
%nastepnie z otwarcia w celu naprawenia krawedzi
bim = imopen(bim,ones(3));

% subplot(1,2,2);
% imshow(bim); % przeksztalcony binarny OK

% 
% bim = bwmorph(bim,'skel',Inf);
% subplot(1,2,2);
imshow(bim);
subplot(1,2,2);
% bim = bwmorph(bim,'endpoints');
% bim = bwmorph(bim,'branchpoints');

% bim = bwmorph(bim,'thicken',Inf);

l = bwlabel(bim);

% imshow(label2rgb( l));

% imshow(im.*(l==2));


d = bwdist(bim);
% imshow(d, [0, max(d,[],'all')]);

l = watershed(d);
% imshow(label2rgb(l));

imshow(im.*(l==2));