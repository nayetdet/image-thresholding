clear; clc; close all;
pkg load image;

I = imread('assets/desafio.tif');
G = imgradient(I);
T1 = prctile(G(:), 99.7);
BW1 = G > T1;
I2 = I .* uint8(BW1);
T2 = graythresh(I2(I2 > 0));
BW2 = im2bw(I, T2);

figure(1),
subplot(2,3,1), imshow(I(1:2:end,1:2:end)), title('(a)'),
subplot(2,3,2), stem((0:255)', imhist(I), 'marker', 'none'), xlim([0 255]), title('(b)'),
subplot(2,3,3), imshow(BW1(1:2:end,1:2:end)), title('(c)'),
subplot(2,3,4), imshow(I2(1:2:end,1:2:end)), title('(d)'),
subplot(2,3,5), stem((0:255)', imhist(I2(I2 > 0)), 'marker', 'none'), xlim([0 255]), title('(e)'),
subplot(2,3,6), imshow(BW2(1:2:end,1:2:end)), title('(f)');
