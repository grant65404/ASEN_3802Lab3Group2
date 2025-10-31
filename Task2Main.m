close all; clear; clc;
%% Part 1 Code 
%% task 2 deliv 1
alpha = 5; % angle of attack in degrees
for i=1:20
    [xvar,y_t,y_c,dy_c,xi,x_U,x_L,y_U,y_L,Name] = AirfoilGeo(1,0,0,12,i*10,0);
    x = unique([x_U,x_L],'stable');
    y = unique([y_U,y_L],'stable');
    cl(i) = Vortex_Panel(x,y,alpha);
    n(i)=i;
end
figure()
plot(x,y)
plot(n,cl)