function [x1, y1, z1] = h_f_RungeKutta(x, y, z, a, b, c, h)
x1 = h*a*(y-x);
y1 = h*(x*(b-z) - y);
z1 = h*(x*y -c*z);