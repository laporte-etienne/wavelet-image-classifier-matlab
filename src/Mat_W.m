
function [WN] = Mat_W(t)
r2 = sqrt(2);
nl = t / 2;
M_H = zeros(nl, t);
M_G = zeros(nl, t);
dec = 3;

for i = 1:nl
    if i == 1
        M_H(1, 1) = r2 / 2;
        M_H(1, 2) = r2 / 2;
        M_G(1, 1) = r2 / 2;
        M_G(1, 2) = -r2 / 2;
    else
        M_H(i, dec) = r2 / 2;
        M_H(i, dec + 1) = r2 / 2;
        M_G(i, dec) = r2 / 2;
        M_G(i, dec + 1) = -r2 / 2;
        dec = dec + 2;
    end
end

WN = [M_H; M_G];
end
