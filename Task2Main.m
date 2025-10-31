close all; clear; clc;
%% Part 1 Code 
%% task 2
alpha = 5; % angle of attack in degrees
[x,y_t,y_c,dy_c,xi,x_U,~,y_U,y_L,Name] = AirfoilGeo(1,4,4,15)
%cl = Vortex_Panel(,,alpha)