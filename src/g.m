
function y = g(b, v)
L = length(v);

p1 = 1 + (psi(1 ./ b) ./ b);
p2_1 = sum((abs(v).^b) .* log(abs(v)));
p2_2 = sum(abs(v).^b);
p2 = p2_1 ./ p2_2;

p3_1 = log((b ./ L) .* sum(abs(v).^b));
p3_2 = b;
p3 = p3_1 ./ p3_2;

y = p1 - p2 + p3;
end
