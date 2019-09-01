clc;
clear all;
close all;
[Filename, Pathname] = uigetfile('*.jpg', 'Pilih File');
name = strcat (Pathname, Filename);
im=imread(name);
im=rgb2gray(im);
imshow(im);
title('Tes Wajah');

Ftest= trainingWajah(im)

load db.mat
Ftrain = db(:,1:2);
Ctrain=db(:,3);
for(i=1:size(Ftrain,1))
   dist(i,:)=sum(abs(Ftrain(i,:)-Ftest)); 
end
Min = min(dist);
if(Min<3)
   m= find(dist==min(dist),1);
   det_class=Ctrain(m);
   msgbox(strcat('ID = ',num2str(det_class))); 
else
   msgbox ('Tidak Terdeteksi');
end