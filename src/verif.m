
function [] = verif(a1, b1, v)
i = 1;
for x = -10:0.01:10
    y(i) = densite(a1, b1, x);
    i = i + 1;
end
xvar = -10:0.01:10;
[z, w] = hist(v, 100);
hold on
bar(w, z / trapz(w, z));
plot(xvar, y, '-r');
% title(['Histogramme pour image: ', num2str(imi), ' sous bande : ', num2str(s)]);
hold off
end
