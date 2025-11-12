clear
clc
close all
tic

%% Part 1, Task 3
c = 25;
D1 = 0; % Must be 1 digit
D2 = 0; % Must be 1 digit
D3 = 12; % Must be 1 or 2 digits

n = 1000;

[x_1,y_t_1,y_c_1,dy_c_1,xi_1,XB_1,YB_1,AirfoilName_1] = AirfoilGeo(c,D1,D2,D3,n);
clear D1 D2 D3

D1 = 2; % Must be 1 digit
D2 = 4; % Must be 1 digit
D3 = 12; % Must be 1 or 2 digits

[x_2,y_t_2,y_c_2,dy_c_2,xi_2,XB_2,YB_2,AirfoilName_2] = AirfoilGeo(c,D1,D2,D3,n);
clear D1 D2 D3

D1 = 4; % Must be 1 digit
D2 = 4; % Must be 1 digit
D3 = 12; % Must be 1 or 2 digits

[x_3,y_t_3,y_c_3,dy_c_3,xi_3,XB_3,YB_3,AirfoilName_3] = AirfoilGeo(c,D1,D2,D3,n);
clear D1 D2 D3

alpha = -5:5;

for i = 1:length(alpha)
    CL_1(i) = Vortex_Panel(XB_1,YB_1,alpha(i));
    CL_2(i) = Vortex_Panel(XB_2,YB_2,alpha(i));
    CL_3(i) = Vortex_Panel(XB_3,YB_3,alpha(i));
end

P(1).values = polyfit(alpha(:),CL_1(:),1);
P(2).values = polyfit(alpha(:),CL_2(:),1);
P(3).values = polyfit(alpha(:),CL_3(:),1);
% Y intercept
alpha_L0_y(1) = P(1).values(2);
alpha_L0_y(2) = P(2).values(2);
alpha_L0_y(3) = P(3).values(2);
alpha_0(1) = P(1).values(1);
alpha_0(2) = P(2).values(1);
alpha_0(3) = P(3).values(1);
% X intercept 
alpha_L0_x(1) = alpha_L0_y(1) / alpha_0(1);
alpha_L0_x(2) = alpha_L0_y(2) / alpha_0(2);
alpha_L0_x(3) = alpha_L0_y(3) / alpha_0(3);
%% Thin Airfoil Theory Calculation

dzdx_1 = polyfit(linspace(0,c,n),dy_c_1(:),1);
dzdx_2 = polyfit(linspace(0,c,n),dy_c_2(:),1);
dzdx_3 = polyfit(linspace(0,c,n),dy_c_3(:),1);
% Y intercept
alpha_L0_TAT_y(1) = ((-(dzdx_1(1) * c * sin(2 * pi) + ((-8 * dzdx_1(1) * c) - 8 ...
    * dzdx_1(2)) * sin(pi) + ((6 * dzdx_1(1) * c) + (8 * dzdx_1(2)) * pi)) / 8) - ...
    (-(dzdx_1(1) * c * sin(2 * 0) + ((-8 * dzdx_1(1) * c) - 8 ...
    * dzdx_1(2)) * sin(0) + ((6 * dzdx_1(1) * c) + (8 * dzdx_1(2)) * 0)) / 8));

alpha_L0_TAT_y(2) = ((-(dzdx_2(1) * c * sin(2 * pi) + ((-8 * dzdx_2(1) * c) - 8 ...
    * dzdx_2(2)) * sin(pi) + ((6 * dzdx_2(1) * c) + (8 * dzdx_2(2)) * pi)) / 8) - ...
    (-(dzdx_2(1) * c * sin(2 * 0) + ((-8 * dzdx_2(1) * c) - 8 ...
    * dzdx_2(2)) * sin(0) + ((6 * dzdx_2(1) * c) + (8 * dzdx_2(2)) * 0)) / 8));

alpha_L0_TAT_y(3) = ((-(dzdx_3(1) * c * sin(2 * pi) + ((-8 * dzdx_3(1) * c) - 8 ...
    * dzdx_3(2)) * sin(pi) + ((6 * dzdx_3(1) * c) + (8 * dzdx_3(2)) * pi)) / 8) - ...
    (-(dzdx_3(1) * c * sin(2 * 0) + ((-8 * dzdx_3(1) * c) - 8 ...
    * dzdx_3(2)) * sin(0) + ((6 * dzdx_3(1) * c) + (8 * dzdx_3(2)) * 0)) / 8));

alpha_0_TAT(1) = (CL_1(end)-alpha_L0_TAT_y(1))/alpha(end);
alpha_0_TAT(2) = (CL_1(end)-alpha_L0_TAT_y(1))/alpha(end);
alpha_0_TAT(3) = (CL_1(end)-alpha_L0_TAT_y(1))/alpha(end);
% X intercept
alpha_L0_TAT_x(1) = alpha_L0_TAT_y(1) / alpha_0_TAT(1);
alpha_L0_TAT_x(2) = alpha_L0_TAT_y(2) / alpha_0_TAT(2);
alpha_L0_TAT_x(3) = alpha_L0_TAT_y(3) / alpha_0_TAT(3);
clear alpha_L0_TAT_y alpha_L0_y
hold on
    plot(alpha,CL_1,Color='b')
    plot(alpha,CL_2,Color='r')
    plot(alpha,CL_3,Color='m')
    xline(0,Color='k');
    yline(0,Color='k');
    
    xlabel('AoA [deg]')
    ylabel('Cl')
    title('Camber effect on Lift Slope')
    legend('NACA 0012','NACA 2412','NACA 4412',location="best")
    
hold off



