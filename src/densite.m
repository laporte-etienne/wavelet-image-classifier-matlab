
function y = densite(a, b, x)
y = b ./ (2 .* a .* gamma(1 ./ b)) .* exp(-(abs(x) ./ a).^b);
end
