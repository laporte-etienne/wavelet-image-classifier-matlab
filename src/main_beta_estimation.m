
clear all
close all
clc

global Images
global v_D1 v_D2 v_D3
global v_H1 v_H2 v_H3
global v_V1 v_V2 v_V3
global imi
global s
global v

epsilon = 1e-7;
v_Long = [4096, 4096, 4096, 1024, 1024, 1024, 256, 256, 256];
a = cell(16, 9);
b = cell(16, 9);
beta0 = cell(16, 9);

%% Chemin image
chemin = 'C:\Users\Utilisateur\Desktop\Projet 5A\Codes\Base texture\Avec Chiffres\32.ppm';
image = imread(chemin);

%% Matrices Luminance
IM = rgb2gray(image);
Av = double(IM);

%% Separation en 16 images
r = Separation(Av);

%% Boucle sur les 16 images de l’image
imi = 4;
Av = Images{imi};
obtenirMatsousbande0(Av);

vec = {v_D1, v_H1, v_V1, v_D2, v_H2, v_V2, v_D3, v_H3, v_V3};

%% Newton pour le beta sur chaque sous-bande de chaque image
s = 5;

% Paramètres Newton
L = v_Long(s);
m1 = (1 / L) * sum(abs(vec{s}));
m2 = (1 / L) * sum(vec{s} .* vec{s});
v = vec{s};

figure(1);
plotg(v);
b0 = tableF(m1, m2);
beta0{imi, s} = b0;

%% Appel fonction Newton
[b{imi, s}, nbiter, bb] = newton('g', 'dg', b0, v, epsilon);
kk = b{imi, s};
a{imi, s} = ((b{imi, s} / L) * sum(abs(v).^b{imi, s}))^(1 / b{imi, s});

%% Vérification de l’approximation
a1 = a{imi, s};
b1 = b{imi, s};
