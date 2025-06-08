
function [b, nb, bb] = newton(g, dg, b0, v, epsilon)
%% Variables
% bb: liste des itérations de beta
% nb: nombre d’itérations pour répondre à la condition epsilon
% b : valeur de beta à chaque itération
% bt: valeur de beta à l’itération précédente

%% Algorithme
err = 1;
bt = b0;
b = b0;
bb = [b0];
nb = 0;

while (err > epsilon)
    nb = nb + 1;
    b = b - feval(g, b, v) / feval(dg, b, v);
    if b < 0
        b = 0.01;
    end
    err = norm(b - bt);
    bt = b;
    bb = [bb, b];
end
end
