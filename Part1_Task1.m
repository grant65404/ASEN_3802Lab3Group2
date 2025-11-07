clear
clc
close all
tic

%% Part 1, Task 1
% NACA 0018
c = 1;
D1 = 0; % Must be 1 digit
D2 = 0; % Must be 1 digit
D3 = 18; % Must be 1 or 2 digits
n = 500;

[x,y_t,y_c,dy_c,xi,XB,YB,Name] = AirfoilGeo(c,D1,D2,D3,n);

figure()
hold on
axis equal
plot(x,y_c)
plot(XB,YB,"k")
title(Name)
xlabel("Chord Length [m]")
ylabel("Airfoil Thickness [m]")
legend("Mean Camber Line","Airfoil Geometry","Location","northeast")
print(Name + '_Geo','-r300','-dpng')

% NACA 2418
c = 1;
D1 = 2; % Must be 1 digit
D2 = 4; % Must be 1 digit
D3 = 18; % Must be 1 or 2 digits
n = 500;

[x,y_t,y_c,dy_c,xi,XB,YB,Name] = AirfoilGeo(c,D1,D2,D3,n);

figure()
hold on
axis equal
plot(x,y_c)
plot(XB,YB,"k")
title(Name)
xlabel("Chord Length [m]")
ylabel("Airfoil Thickness [m]")
legend("Mean Camber Line","Airfoil Geometry","Location","northeast")
print(Name + '_Geo','-r300','-dpng')

clear D1 D2 D3 n x y_t y_c xi XB YB Name

runtime = toc;