clear;clc;

im = double(imread('zubr.jpg'))/255;
gim = im2gray(im);

%filtr dolnoprzepustowy, rozmywa, odszumia
% f = ones(3);
% f = f/sum(f,'all');
% % f = fspecial('gaussian',11, 1);
% fim = imfilter(gim,f);

subplot(1,2,1);
imshow(gim);
% subplot(1,2,2);
% imshow(fim);


% filtr górnoprzepustowy

% f = -ones(3);
% f(2,2) = 9;
% % fim = imfilter(gim,f);
% fim = imfilter(fim,f);% najpierw przepusciilismy przez dolnoprzepustowy, a potem przez górno
% 
% 
% subplot(1,2,1);
% imshow(gim);
% subplot(1,2,2);
% imshow(fim);

%filtr medianowy
% fim = medfilt2(gim);
% imshow(fim);
% 
% subplot(1,2,2);
% imshow(fim);


%binaryzacja obrazu
bim = gim;
% t = graythresh(gim);%prog otsu, daje w miarę przyzwoity próg
t = 0.6;
% bim(bim>=t) = 1;
% bim(bim<t) = 0;
bim = ~imbinarize(gim,t);%to samo co powyzej % tylda ~ neguje, czyli daje odwrocone kolory
subplot(1,2,1);
% imshow(bim);

%dylatacja
%maximum - zmieni czarny piksel w bialy, jezeli ten czarny piksel sasiaduje
%z bialym

% subplot(1,2,2);
bim  = imdilate(bim,ones(5));
bim  = imerode(bim, ones(5));
% imshow(bim);

%erozja
%minimum - jezeli piksel czarny zostanie czarny, jezeli jest bialy a
%przynajmniej jeden czarny w otoczeniu to stanie sie czarny

% subplot(1,2,2);
% bim  = imerode(bim,ones(5));
% bim = imdilate(bim, ones(5));
imshow(bim);

subplot(1,2,2);

zubr = im.*bim;
imshow(zubr);







