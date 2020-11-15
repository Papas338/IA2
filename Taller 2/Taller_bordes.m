%% Practica vision artificial
%Limpiar el Workspace
clear all
close all
clc
%% Lectura de las imagenes
imds = imageDatastore({'Integrantes.jpg','ImagenPlana.png'});
img = readimage(imds,1); %Lee la imagen del datastore
img = rgb2gray(img); %Pasa a blanco y negro
imshow(img);
%% Tratamiento de los pixeles
P = impixel(img,2,2);
bv = [,];