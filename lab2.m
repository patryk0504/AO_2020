clear;clc;


im = imread('zubr.jpg');
im = double (im)/255;

gim = mean(im,3);
gim2 = rgb2gray(im);

x = linspace(0,1,256);

h=2;%ile wierszy
w=3;%ile kolumn
i=1;

%konwersja do odcieni szarości

%subplot(h,w,i); i=i+1;
%imshow(gim);

%subplot(h,w,i); i=i+1;
%imhist(gim);

subplot(h,w,i); i=i+1;
imshow(gim2);

subplot(h,w,i); i=i+1;
imhist(gim2);

y1 = x;
y1(y1<0) = 0;
y1(y1>1) = 1;

subplot(h,w,i); i = i+1;
plot(x,y1);

ylim([0,1]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zmiana jasnosci


% b = .2;
% bim = gim2 + b;
% bim(bim<0) = 0.;
% bim(bim>1) = 1.;

% y = x+b;
% y(y<0) = 0;
% y(y>1) = 1;
% 
% subplot(h,w,i); i=i+1;
% imshow(bim);
% 
% subplot(h,w,i); i = i+1;
% imhist(bim);
% 
% subplot(h,w,i); i = i+1;
% plot(x,y);
% 
% ylim([0,1]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zmiana kontrastu


% c = 0.7;
% cim = gim2 * c;
% 
% cim(cim<0) = 0.;
% cim(cim>1) = 1.;
% 
% 
% %dla kazdej z liczb z x
% y = x*c;
% y(y<0) = 0;
% y(y>1) = 1;
% 
% subplot(h,w,i); i=i+1;
% %gim = 1 -gim;%inwersja
% imshow(cim);
% 
% subplot(h,w,i); i = i+1;
% %gim = 1 -gim;
% imhist(cim);%wartosci się przesunely w prawo
% 
% 
% subplot(h,w,i); i = i+1;
% plot(x,y);
% ylim([0,1]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%przesuniecie punktu 1/2 do 0

% c = 0.7;
% cim = (gim2 - 0.5) * c + 0.5;
% 
% cim(cim<0) = 0.;
% cim(cim>1) = 1.;
% 
% 
% %dla kazdej z liczb z x
% y = (x - 0.5)*c + 0.5;
% y(y<0) = 0;
% y(y>1) = 1;
% 
% subplot(h,w,i); i=i+1;
% %gim = 1 -gim;%inwersja
% imshow(cim);
% 
% subplot(h,w,i); i = i+1;
% %gim = 1 -gim;
% imhist(cim);%wartosci się przesunely w prawo
% 
% 
% subplot(h,w,i); i = i+1;
% plot(x,y);
% ylim([0,1]);
% 
% imtool(im);



%gammma

gamma = 2;
gammaim = gim.^(1/gamma);
y = x.^gamma;

subplot(h,w,i); i=i+1;
imshow(gammaim);

subplot(h,w,i); i = i+1;
imhist(gammaim);%wartosci się przesunely w prawo
% ylim([0,30000]);

subplot(h,w,i); i=i+1;
plot(x,y);
ylim([0,2]);

