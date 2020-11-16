clear; clc; 

im = double(imread('opera.jpg'))/255;
gim = rgb2gray(im);

% subplot(1,2,1);
% imshow(gim);


f = fft2(gim);
amp = abs(f);%amplituda
phase = angle(f);%kat

ampmax = max(amp,[],'all');
% imshow(log(amp),[0,log(ampmax)]);

%po zamianie cwiartek miejscami
subplot(1,2,2);
% imshow(fftshift(log(amp)),[0,log(ampmax)]);
% imshow(phase,[-pi,pi]);


%obcinanie amplitudy

[h,w] = size(gim);
% mask = zeros(h,w);
% mask(200:h-200, 300:w-300) = 1;
% amp = amp.*fftshift(mask);


%filtrowanie

fil = fspecial('gaussian',[h,w],4);
ffil = fft2(fil);
famp = abs(ffil);
fphase = angle(ffil);

%manewrowanie amp i faza
%zmiana amp
% amp(20,20)=100000;
% phase(1,1) = phase(1,1)+pi;%przesuniece fazy o pi
% imshow(fftshift(log(amp)),[0,log(ampmax)]);
fampmax = max(famp,[],'all');
fampmin = min(famp,[],'all');
% subplot(1,2,1);
% imshow(fftshift(log(famp)),[log(fampmin),log(fampmax)]);%widmo amp gaussa
% subplot(1,2,2);
% imshow(fftshift(fphase),[-pi,pi]);%widmo fazowe gaussa
% imshow(phase,[-pi,pi]);


amp = amp.*famp;

imshow(fftshift(log(amp)),[0,log(ampmax)]);


%odwrotna transf f 
fi = amp.*exp(1i*phase);
im2 = abs(ifft2(fi));
subplot(1,2,1);
imshow(im2);