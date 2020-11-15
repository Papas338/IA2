%% Practica vision artificial
%Limpiar el Workspace
clear all
close all
clc
%% Lectura de las imagenes
imds = imageDatastore('Imagenes');
img = readimage(imds,2); %Lee la imagen del datastore
img = rgb2gray(img); %Pasa a blanco y negro
imshow(img);
%% Formación de las matrices
img = im2double(img);
hor = img; %Copia los valores de la imagen a una matriz horizontal
ver = img; %Copia los valores de la imagen a una matriz vertical
gra = img; %Copia los valores de la imagen a una gradiente
bin = img; %Creacion matriz del mismo tamaño
bin2 = img; %Creacion matriz del mismo tamaño
[alto, ancho] = size(img); %Sacar el tamaño de la matriz
%% Tratamiento de los pixeles horizontal
%A(1,1) = (img(1,1) + (img(1,2) * (-1)));
for i = 1:alto
    for j = 1:ancho-1
        hor(i,j) = (img(i,j) + (img(i,j+1) * (-1)));
    end
end
for i = 1:alto
    hor(i,ancho) = 0;
end
%% Tratamiento de los pixeles vertical
%A(1,1) = (img(1,1) + (img(2,1) * (-1)));
for i = 1:alto-1
    for j = 1:ancho
        ver(i,j) = (img(i,j) + (img(i+1,j) * (-1)));
    end
end
for j = 1:ancho
    ver(alto,j) = 0;
end
%% Calculo de la gradiente
for i = 1:alto
    for j = 1:ancho
        gra(i,j) = sqrt(hor(i,j)^2 + ver(i,j)^2);
    end
end
%% Calculo matriz binaria manual
gra = im2uint8(gra);
valor = 18;
for i = 1:alto
    for j = 1:ancho
        if gra(i,j) < valor
            bin(i,j) = 0;
        else
            bin(i,j) = 255;
        end
    end
end
%% Calculo matriz binaria matlab
bin2 = imbinarize(gra);
%% Ilustración de las imagenes
hor = im2uint8(hor);
ver = im2uint8(ver);

figure;
subplot(2,2,1);
montage(hor);
title('Horizontal');
subplot(2,2,3);
montage(ver);
title('Vertical');
subplot(2,2,[2 4]);
montage(gra)
title('Gradiente');

figure;
subplot(1,2,2);
montage(bin);
title('Calculo binario manual');
subplot(1,2,1);
montage(gra);
title('Gradiente');

figure;
subplot(1,2,1);
montage(bin);
title('Calculo binario manual');
subplot(1,2,2);
montage(bin2);
title('Calculo binario Matlab');