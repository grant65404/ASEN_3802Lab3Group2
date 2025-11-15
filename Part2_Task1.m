clc
clear
close all

%%

Case = 3;

if Case == 1
    alpha = 5; % in degree
    b = 100;  % in feet
    a0_r = 2*pi();   % cross setional lift slope at root per radians
    a0_t = 2*pi();   % cross setional lift slope at root per radians
    c_r = 10;    % chord at root in feet
    c_t = 10;     % chord at tip in feet
    aero_r = 0;  % zero life AoA at root in radians
    aero_t = 0;  % zero life AoA at tip in radians
    twist_r = 0;   % geometric twist at root in radians
    twist_t = 0;   % geometric twist at tip in radians
    geo_r = alpha * (pi()/180) + twist_r;   % geometric AoA at root in radians
    geo_t = alpha * (pi()/180) + twist_t;   % geometric AoA at tip in radians
    N = 5;

    % Case 1
    e_ex = 0.9227;
    c_L_ex = 0.4402;
    c_Di_ex = 0.0067;

elseif Case == 2 
    alpha = 5; % in degree
    b = 100;  % in feet
    a0_r = 2*pi();   % cross setional lift slope at root per radians
    a0_t = 2*pi();   % cross setional lift slope at root per radians
    c_r = 10;    % chord at root in feet
    c_t = 8;     % chord at tip in feet
    aero_r = 0;  % zero life AoA at root in radians
    aero_t = 0;  % zero life AoA at tip in radians
    twist_r = 0;   % geometric twist at root in radians
    twist_t = 0;   % geometric twist at tip in radians
    geo_r = alpha * (pi()/180) + twist_r;   % geometric AoA at root in radians
    geo_t = alpha * (pi()/180) + twist_t;   % geometric AoA at tip in radians
    N = 5;

    % Case 2
    e_ex = 0.9430;
    c_L_ex = 0.4534;
    c_Di_ex = 0.0062;

elseif Case == 3
    alpha = 5; % in degree
    b = 100;  % in feet
    a0_r = 6.5;   % cross setional lift slope at root per radians
    a0_t = 6.3;   % cross setional lift slope at root per radians
    c_r = 10;    % chord at root in feet
    c_t = 8;     % chord at tip in feet
    aero_r = -2*pi/180;  % zero life AoA at root in radians
    aero_t = 0;  % zero life AoA at tip in radians
    twist_r = 2 * (pi()/180);   % geometric twist at root in radians
    twist_t = 0;   % geometric twist at tip in radians
    geo_r = alpha * (pi()/180) + twist_r;   % geometric AoA at root in radians
    geo_t = alpha * (pi()/180) + twist_t;   % geometric AoA at tip in radians
    N = 5;

    % Case 3
    e_ex = 0.9795;
    c_L_ex = 0.6674;
    c_Di_ex = 0.0130;

end

[e,c_L,c_Di] = PLLT(b,a0_t,a0_r,c_t,c_r,aero_t,aero_r,geo_t,geo_r,N);

clear b a0_r a0_t c_r c_t aero_r aero_t twist_r twist_t geo_r geo_t N