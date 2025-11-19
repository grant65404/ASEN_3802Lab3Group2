function [e,c_L,c_Di] = PLLT(b,a0_t,a0_r,c_t,c_r,aero_t,aero_r,geo_t,geo_r,N)

AR = (b^2)/(0.5*b*(c_r+c_t));

    for i = 1:N
        Theta(i) = i*pi()/(2*N);
        Y(i) = -(b/2) * cos(Theta(i));
        a0(i) = a0_r + (a0_r-a0_t)*Y(i)/(b/2);
        c(i) = c_r + (c_r-c_t)*Y(i)/(b/2);
        aero(i) = aero_r + (aero_r-aero_t)*Y(i)/(b/2);
        geo(i) = geo_r + (geo_r-geo_t)*Y(i)/(b/2);

        D(i) = geo(i) - aero(i);

        for j = 1:N
             M(j,i) = (((4*b)/(a0(i)*c(i)))*sin((2*j - 1)*Theta(i))) + (2*j - 1)*(sin((2*j - 1)*Theta(i))/sin(Theta(i)));
        end
    end

    x = D/M;

    for i = 1:N
        A(2*i - 1) = x(i);
        A(2*i) = 0;
    end

    Delta = 0;
    for n = 2:(2*N)
        Delta = Delta + n*(A(n)/A(1))^2;
    end

    c_L = x(1)*pi()*AR;
    c_Di = ((c_L^2)/(pi()*AR))*(1+Delta);
    e = 1/(1+Delta);

end