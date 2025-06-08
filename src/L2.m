
function [r] = L2(v_a1, v_b1, v_a2, v_b2)
p1 = sum((v_a1 - v_a2).^2);
p2 = sum((v_b1 - v_b2).^2);
r = p1 + p2;
end
