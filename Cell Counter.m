im = imread("cells.png");
imshow(im);
SE = strel('disk',11);
Hintergrund = imclose(im,SE);
imshow(Hintergrund);
Y = imsubtract(Hintergrund,im);
Y=255-Y;
imshow(Y);
Y = im2gray(Y);
imshow(Y);
Y = im2bw(Y,0.70);
imshow(Y);
A = ones(3);


Y_open = imopen(Y,A);
imshow(Y_open);
 

Y_close = imclose(Y_open,strel('disk',4));
imshow(Y_close);

im_filtered = im;

im_filtered(Y_close == 0) = 255; 

imshow(im_filtered);

[L, n] = bwlabel(~Y_close);
RGB = label2rgb(L, 'spring', 'c', 'shuffle');
imshow(RGB);
 stats = regionprops(L)

stats(10)
stats(2).Centroid(2)
hold on 
for x = 1:size(stats)
text(stats(x).Centroid(1),stats(x).Centroid(2),string(x));
end