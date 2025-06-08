
function [] = plotg(v)
i = 1;
for beta = 0.01:0.01:2
    f(i) = g(beta, v);
    i = i + 1;
end
bvar = 0.01:0.01:2;
plot(bvar, f);
end
