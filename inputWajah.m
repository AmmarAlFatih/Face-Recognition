clc;
clear all;
close all;
[Filename, Pathname] = uigetfile('*.jpg', 'File Selector');
name = strcat (Pathname, Filename);
im=imread(name);
im=rgb2gray(im);
imshow(im);
title('Training Wajah');
c=input('Masukkan ID ');

F = trainingWajah(im);
try
    load db;
    F=[F c];
    db=[db;F];
    save db.mat db
catch
   db=[F  c];
   save db.mat db
end