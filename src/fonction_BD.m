
function [Base] = fonction_BD(nom_BD)
tic
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

rep = 'F:\Base texture avec choix\Bases choix\';
rep = [rep, nom_BD, '\'];
rep = dir(rep);
taille = length(find([rep.isdir] == 0));

for numI = 1:taille
    %% Chemin image
    chemin = 'F:\Base texture avec choix\Bases choix\';
    chemin = [chemin, nom_BD, '\'];
    chemin = [chemin, num2str(numI), '.ppm'];
    image = imread(chemin);

    %% Matrices Luminance
    IM = rgb2gray(image);
    Av = double(IM);

    %% Séparation en 16 images
    r = Separation(Av);

    %% Boucle sur les 16 parties
    for imi = 1:16
        Av = Images{imi};
        obtenirMatsousbande0(Av);
        vec = {v_D1, v_H1, v_V1, v_D2, v_H2, v_V2, v_D3, v_H3, v_V3};

        %% Boucle sur les 9 sous-bandes
        for s = 1:9
            L = v_Long(s);
            m1 = (1 / L) * sum(abs(vec{s}));
            m2 = (1 / L) * sum(vec{s} .* vec{s});
            v = vec{s};
            b0 = tableF(m1, m2);
            beta0{imi, s} = b0;

            [b{imi, s}, nbiter, bb] = newton('g', 'dg', b0, v, epsilon);
            kk = b{imi, s};
            a{imi, s} = ((b{imi, s} / L) * sum(abs(v).^b{imi, s}))^(1 / b{imi, s});

            %% Enregistrement dans la base
            a1 = a{imi, s};
            b1 = b{imi, s};
            Base(numI, imi, s, 1) = a1;
            Base(numI, imi, s, 2) = b1;
        end
    end
end

save('Base.mat', 'Base');
toc
end
