close all; clear; clc;
%% Part 1, task 2
c = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% deliverable 1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = linspace(10,1000);
for i=1:length(n)
    [~,~,~,~,~,xt2d1,yt2d1,~] = AirfoilGeo(c,0,0,12,n(i)/2 - 1);
    c_lt2d1(i) = Vortex_Panel(xt2d1,yt2d1,5);
end
figure()
plot(n,c_lt2d1,linewidth=1.2);
title('Convergence Study of c_L')
xlabel('Num of Panels')
ylabel('Coeff. of Lift')
saveas(gcf,'deliv1P1T2','png')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% deliverable 2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = 500;
aft = [6,12,18];
alphat2d2 = linspace(-7,7,14);
for i=1:length(aft)
    [~,~,~,~,~,xt2d2,yt2d2,Name(i)] = AirfoilGeo(c,0,0,aft(i),n);
    for j=1:length(alphat2d2)
    clt2d2(i,j) = Vortex_Panel(xt2d2,yt2d2,alphat2d2(j));
    end
    P = polyfit(alphat2d2,clt2d2(i,:),1);
    a_0(i) = P(1);
end
figure()
hold on
plot(alphat2d2,clt2d2(1,:),linewidth=1.2)
plot(alphat2d2,clt2d2(2,:),linewidth=1.2)
plot(alphat2d2,clt2d2(3,:),linewidth=1.2)
xline(0,'k',linewidth=.8)
yline(0,'k',linewidth=.8)
xlabel('AoA (deg)')
ylabel('Coeff. of lift')
title('Thickness effect on Lift Slope')
legend(Name,location="northwest")
saveas(gcf,'deliv2P1T2','png')
% TAT results
al0 = [0,0,0];
a = [2*pi*pi/180,2*pi*pi/180,2*pi*pi/180];

