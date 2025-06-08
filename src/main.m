
clear all
close all
clc
tic
profile on

%% Importation de la base de données
load('Base.mat');

%% Distance KLD
taille = size(Base, 1);
Distance = zeros(1, taille);
j = 1;
k = 1;
p = zeros(1, taille * 16);

for numItest = 1:taille
    for imitest = 1:16
        for numI = 1:taille
            for imi = 1:16
                D = 0;
                for s = 1:9
                    D = D + KLD(Base(numItest, imitest, s, 1), ...
                                Base(numItest, imitest, s, 2), ...
                                Base(numI, imi, s, 1), ...
                                Base(numI, imi, s, 2));
                end
                Distance((numI - 1) * 16 + imi) = D;
            end
        end
        Liste_R = [1:(taille * 16); Distance]; %% Liste de toutes les images avec leur distance
        Classement = sortrows(Liste_R.', 2).';
        Classement = Classement(1, :);
        liste_classement = Classement(2:17); %% Prend les 15 meilleurs, hors image de référence
        p(j) = pourcentage(liste_classement, 16 * k);
        j = j + 1;
    end
    k = k + 1;
end

Proportion = mean(p);
disp('Proportion :');
disp(Proportion);

toc
t = toc;
profile viewer
