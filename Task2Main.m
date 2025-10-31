close all; clear; clc;
%% Part 1 Code 
%% task 2 deliv 1
alpha = 5; % angle of attack in degrees
[xvar,y_t,y_c,dy_c,xi,x_U,x_L,y_U,y_L,Name] = AirfoilGeo(1,0,0,12);
x = unique([x_U,x_L]);
y = unique([y_U,y_L]);
cl = Vortex_Panel(x,y,alpha)