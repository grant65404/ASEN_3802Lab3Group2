function [x,y_t,y_c,dy_c,xi,x_U,X_L,y_U,y_L,AirfoilName] = AirfoilGeo(c,D1,D2,D3)
% Airfoil Name
D1_str = num2str(D1);
D2_str = num2str(D2);
D3_str = num2str(D3);
if D3 < 10
    D3_str = ['0' D3_str];
end
AirfoilName = "NACA " + D1_str + D2_str + D3_str;

% Airfoil Geometry
x = linspace(0,c,1000);

t = D3/100;
m = D1/100;
p = D2/10;

for i = 1:length(x)
    y_t(i) = (t/0.2)*c*(...
        (0.2969*sqrt(x(i)/c))...
        - (0.1260*(x(i)/c))...
        - (0.3516*(x(i)/c)^2)...
        + (0.2843*(x(i)/c)^3)...
        - (0.1036*(x(i)/c)^4));

    if x(i) < p*c
        y_c(i) = m*(x(i)/(p^2))*((2*p) - (x(i)/c));
        dy_c(i) = (m*(x(i)/(p^2))*(-(1/c))) + (m*(1/(p^2))*((2*p) - (x(i)/c)));
    else
        y_c(i) = m*( (c-x(i)) / ((1-p)^2) )*(1 + (x(i)/c) -2*p);
        dy_c(i) = (m*( (-1) / ((1-p)^2) )*(1 + (x(i)/c) -2*p)) + (m*( (c-x(i)) / ((1-p)^2) )*(1/c));
    end

    xi(i) = atan(dy_c(i));

    x_U(i) = x(i) - y_t(i)*sin(xi(i));
    x_L(i) = x(i) + y_t(i)*sin(xi(i));
    y_U(i) = y_c(i) + y_t(i)*cos(xi(i));
    y_L(i) = y_c(i) - y_t(i)*cos(xi(i));

end

figure()
hold on
axis equal
%plot(x,y_t)
plot(x,y_c)
plot(x_U,y_U,"k")
plot(x_L,y_L,"k")
title(AirfoilName)
xlabel("Chord Length [m]")
ylabel("Airfoil Thickness [m]")
legend("Mean Camber Line","Airfoil Geometry","Location","northeast")
end
