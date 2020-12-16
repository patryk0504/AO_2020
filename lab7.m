clear; clc;

im = double(imread('ptaki.jpg'))/255;
imshow(im);
% gim = rgb2gray(im);
% imshow(gim);
% imhist(gim);
% bim = imbinarize(gim,.3);
% imshow(bim);

for i = 1:3
    subplot(3,2,2*i-1);
    imshow(im(:,:,i));
    subplot(3,2,2*i);
    imhist(im(:,:,i));
end
    
r = im(:,:,1);
r(r<.15) = 1;
r = imbinarize(r,.3);
b = im(:,:,3);
b = ~imbinarize(b,.65);

bim = r|b;
bim = imopen(bim,ones(3));
bim = imclose(bim,ones(3));

subplot(1,1,1);
imshow(bim);

l = bwlabel(bim);
imshow(l==2);

a = regionprops(bim,'all');
fun = {@AO5RBlairBliss, @AO5RCircularityS,@AO5RCircularityL, @AO5RShape, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska};
w = zeros(length(a), length(fun));

for i = 1:length(a)
    for j = 1:length(fun)
        w(i,j) =  fun{j}(a(i).Image);
    end
end
w
m = mean(w);
s = std(w);
ws = (w-m)./s;
ws
out = max(abs(ws) >2,[],2);

im2 = double(imread('ptaki2.jpg'))/255;
subplot(1,2,1);
imshow(im2);
bim2=  ~imbinarize(rgb2gray(im2),.53);
bim2= imopen(imclose(bim2,ones(5)),ones(3));
subplot(1,2,2);
% imshow(bim2);

a = regionprops(bim2,'all');
w2 = zeros(length(a), length(fun));

for i = 1:length(a)
    for j = 1:length(fun)
        w2(i,j) =  fun{j}(a(i).Image);
    end
end
w2;
m2 = mean(w2);
s2 = std(w2);
ws2 = (w2-m2)./s2;
ws2;
out2 = abs(ws2) > 2;
out2 = max(abs(ws2) >2,[],2);

l2 = bwlabel(bim2);
subplot(1,1,1);
imshow(label2rgb(l2));

edge = [unique(l2([1,end],:)) ; unique(l2(:,[1,end])) ] ;
edge(edge==0) = [];

mid = setdiff(1:12,edge);

g1 = w(out==0,:);
g2 = w2(mid,:);
g3 = [ w(out,:); w2(edge,:)];

trainin = [ g1(1:end-2,:); g2(1:end-2,:); g3(1:end-2,:)]';
trainout = [repmat([1,0,0],5,1);repmat([0,1,0],4,1);repmat([0,0,1],6,1);]';
 
nn = feedforwardnet;
nn = train(nn,trainin,trainout);

testin = [g1(end-1:end,:);g2(end-1:end,:);g3(end-1:end,:)]';
res = nn(testin)

out3 = round(res)
