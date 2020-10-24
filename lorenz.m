x0 = 0.1;
y0 = 0;
z0 = 0;
a = 10.0;
b = 28.0;
c = 8.0/3.0;
h = 0.01;
iterations = 10000;
lapse = 400;

for i = 1:iterations; 
[k1(1), k1(2), k1(3)] =  h_f_RungeKutta(x0, y0, z0, a, b, c, h);
[k2(1), k2(2), k2(3)] =  h_f_RungeKutta(x0 + k1(1)/2, y0 + k1(2)/2, z0 + + k1(3)/2, a, b, c, h);
[k3(1), k3(2), k3(3)] =  h_f_RungeKutta(x0 + k2(1)/2, y0 + k2(2)/2, z0 + + k2(3)/2, a, b, c, h);
[k4(1), k4(2), k4(3)] =  h_f_RungeKutta(x0 + k3(1)/2, y0 + k3(2)/2, z0 + + k3(3)/2, a, b, c, h);
            
x1 = x0 + k1(1)/6 + k2(1)/3 + k3(1)/3 + k4(1)/6;
y1 = y0 + k1(2)/6 + k2(2)/3 + k3(2)/3 + k4(2)/6;
z1 = z0 + k1(3)/6 + k2(3)/3 + k3(3)/3 + k4(3)/6;

x0 = x1;
y0 = y1;
z0 = z1;
if i > lapse
    A(i-lapse,1) = x1;
    A(i-lapse,2) = y1;
    A(i-lapse,3) = z1;
end
end
plot3(A(:,1),A(:,2),A(:,3))
xlabel('X'); ylabel('Y');zlabel('Z'); title('Lorenz Attractor');
axis tight;
grid on;
clear A;
