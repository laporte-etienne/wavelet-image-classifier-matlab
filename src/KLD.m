
function D = KLD(a1, b1, a2, b2)
p1 = log((b1 .* a2 .* gamma(1 ./ b2)) ./ (b2 .* a1 .* gamma(1 ./ b1)));
p2 = ((a1 ./ a2).^b2) .* (gamma((b2 + 1) ./ b1) ./ gamma(1 ./ b1));
p3 = 1 ./ b1;
D = p1 + p2 - p3;
end
