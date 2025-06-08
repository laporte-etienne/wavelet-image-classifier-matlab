
function [beta0] = tableF(m1, m2)
b_cal = m1 ./ sqrt(m2);
x = 0:0.01:10;
y = F(x);

val_rechercher = b_cal;
% Recherche dans F(x) la position de la valeur la plus proche de b_cal
[C, indice] = min(abs(y - val_rechercher));

% Valeur correspondante dans le vecteur des beta
beta0 = x(indice);
end
