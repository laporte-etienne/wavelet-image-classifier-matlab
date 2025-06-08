
clear all
close all
clc

nomBase = input('Choix de la base ? ', 's'); %% Choix nom de la base
rand_oui = input('Random Base ? ', 's');
methode_analyse = input('Choix de la méthode analyse ? ', 's'); %% Choix : KLD, L1, L2, L1L2, ALL

disp('La base est en cours ...');

switch rand_oui
    case 'oui'
        % Pas d'action si 'oui'
    otherwise
        fonction_BD_rand(nomBase);
        fonction_BD(nomBase);
end

disp('La base a été établie');
disp('Le processus de reconnaissance est en cours ...');

switch methode_analyse
    case 'KLD'
        main_KLD;
    case 'L1'
        main_L1;
    case 'L2'
        main_L2;
    case 'L1L2'
        main_L1_L2;
    case 'ALL'
        main_KLD;
        main_L1;
        main_L2;
        main_L1_L2;
end
