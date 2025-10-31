close all; clear; clc;
%% Part 1 Code 
%% task 2
alpha = 5; % angle of attack in degrees
[~,~,~] = AirfoilGeo(1,4,4,15)
cl = Vortex_Panel(,,alpha)