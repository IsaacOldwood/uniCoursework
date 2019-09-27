function y=spiralplot(k,p)

polar(k*p,p,'.') %This plots points on a polar graph where theta has the value of k*p and rho has the value of p and the points are plotted as periods
title(num2str(k)) %This titles the polar graph with the value of k
end