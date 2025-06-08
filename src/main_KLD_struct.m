
clear all
close all
clc
tic
profile on

%% Importation de la Base de données
load('Base.mat');

%% Distance KLD
taille = Base{end, 2};
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
                    D = D + KLD(...
                        Base{ibase(s, imitest, numItest), 5}, ...
                        Base{ibase(s, imitest, numItest), 6}, ...
                        Base{ibase(s, imi, numI), 5}, ...
                        Base{ibase(s, imi, numI), 6});
                end
                Distance((numI - 1) * 16 + imi) = D;
            end
        end
        Liste_R = [1:(taille * 16); Distance]; %% Liste de toutes les images avec distance
        [~, Classement] = sort(Liste_R, 2);
        liste_classement = Classement(2, 2:17); %% Prend les 15 meilleurs hormis l’image de ref
        p(j) = pourcentage(liste_classement, 16 * k);
        j = j + 1;
    end
    k = k + 1;
end

Proportion = mean(p);
disp('Proportion :');
disp(Proportion);

toc
profile viewer
