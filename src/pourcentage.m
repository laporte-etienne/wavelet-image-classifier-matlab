
function p = pourcentage(liste, zone)
b_inf = zone - 16;
b_sup = zone;
p = (length(find(b_inf <= liste & liste <= b_sup)) / 15) * 100;
end
