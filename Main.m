clear
clc
close all
tic

%% Part 1, Task 1
c = 25;
D1 = 0; % Must be 1 digit
D2 = 0; % Must be 1 digit
D3 = 12; % Must be 1 or 2 digits

n = 2500;

[x,y_t,y_c,dy_c,xi,XB,YB,AirfoilName] = AirfoilGeo(c,D1,D2,D3,n);
clear D1 D2 D3

%% Part 1, task 2
alpha = 5;
%alpha = linspace(-5,5,7);

figure()
hold on
axis equal
plot(x,y_c)
plot(XB,YB,"k")
title(AirfoilName)
xlabel("Chord Length [m]")
ylabel("Airfoil Thickness [m]")
legend("Mean Camber Line","Airfoil Geometry","Location","northeast")

for i = 1:length(alpha)
    c_l(i) = Vortex_Panel(XB,YB,alpha(i));
end
clear i;

if length(alpha) > 1
    figure()
    plot(alpha,c_l)
    xline(0,"k--")
    yline(0,"k")
    title(AirfoilName + "\alpha vs. C_l")
    ylabel("C_l")
    xlabel("\alpha [deg]")
end

%% Part 1, Task 3




%%
runtime = toc;