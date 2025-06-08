
function y = dg(b, v)
L = length(v);

p1 = psi(1 ./ b) ./ (b.^2);
p2 = psi(1, (1 ./ b)) ./ (b.^3); % dérivée de psi
p3 = 1 ./ (b.^2);

p4_1 = sum((abs(v).^b) .* (log(abs(v))).^2);
p4_2 = sum(abs(v).^b);
p4 = p4_1 ./ p4_2;

p5_1 = sum((abs(v).^b) .* log(abs(v)));
p5_2 = sum(abs(v).^b);
p5 = (p5_1 ./ p5_2).^2;

p6_1 = sum((abs(v).^b) .* log(abs(v)));
p6_2 = b .* sum(abs(v).^b);
p6 = p6_1 ./ p6_2;

p7_1 = log((b ./ L) .* sum(abs(v).^b));
p7_2 = b.^2;
p7 = p7_1 ./ p7_2;

y = -p1 - p2 + p3 - p4 + p5 + p6 - p7;
end
