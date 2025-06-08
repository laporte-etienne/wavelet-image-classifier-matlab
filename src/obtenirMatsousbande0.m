
function [] = obtenirMatsousbande0(Av)
global v_D1 v_D2 v_D3
global v_H1 v_H2 v_H3
global v_V1 v_V2 v_V3
vec = cell(9, 1);
S_AV = cell(1, 3);
S_D = cell(1, 3);
S_V = cell(1, 3);
S_H = cell(1, 3);

%% Centre les valeurs
moy = mean(Av(:));
ecart_t = std(Av(:));
Av = (Av - moy) ./ ecart_t;

%% Calculs
t = length(Av);
i = 1;
while i <= 3
    WN = Mat_W(t);
    res = WN * Av * WN';

    % Séparation en sous-matrices
    Av = res(1:t/2, 1:t/2);
    V  = res(1:t/2, (t/2)+1:t);
    H  = res((t/2)+1:t, 1:t/2);
    D  = res((t/2)+1:t, (t/2)+1:t);

    if ~isequal(res, [Av, V; H, D])
        disp('Problème dans ObtenirMatsousBande0');
    end

    % Sauvegarde
    S_AV{i} = Av;
    S_D{i} = D;
    S_V{i} = V;
    S_H{i} = H;

    t = length(Av);
    i = i + 1;
end

%% Matrices sous-bandes
D1 = S_D{1}; V1 = S_V{1}; H1 = S_H{1};
D2 = S_D{2}; V2 = S_V{2}; H2 = S_H{2};
D3 = S_D{3}; V3 = S_V{3}; H3 = S_H{3};

%% Distribution des 9 Matrices sous-bandes
v_D1 = D1(:); v_V1 = V1(:); v_H1 = H1(:);
v_D2 = D2(:); v_V2 = V2(:); v_H2 = H2(:);
v_D3 = D3(:); v_V3 = V3(:); v_H3 = H3(:);

% Remplacement des 0
v_D1(v_D1 == 0) = 0.5 / ecart_t;
v_V1(v_V1 == 0) = 0.5 / ecart_t;
v_H1(v_H1 == 0) = 0.5 / ecart_t;
v_D2(v_D2 == 0) = 0.5 / ecart_t;
v_V2(v_V2 == 0) = 0.5 / ecart_t;
v_H2(v_H2 == 0) = 0.5 / ecart_t;
v_D3(v_D3 == 0) = 0.5 / ecart_t;
v_V3(v_V3 == 0) = 0.5 / ecart_t;
v_H3(v_H3 == 0) = 0.5 / ecart_t;

vec = {v_D1; v_V1; v_H1; v_D2; v_V2; v_H2; v_D3; v_V3; v_H3};
end
