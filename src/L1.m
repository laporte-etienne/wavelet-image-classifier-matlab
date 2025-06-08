
function [r] = L1(v_a1, v_b1, v_a2, v_b2)
p1 = sum(abs(v_a1 - v_a2));
p2 = sum(abs(v_b1 - v_b2));
r = p1 + p2;
end
