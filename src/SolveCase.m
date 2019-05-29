function [dP, dJbar] = SolveCase(u0)
for epsilon=0:0.001:0.001
    %Grid
    m = 30; n = 5*m; q = 9; %m=40,n=25m
    p = 0.5; m0 = p*m; n0 = p*m; %Bump
    mstep = 1000; %3000
    L = 50; H = 2;
    
    %Containers
    f = zeros(q,n,m); feq = zeros(q,n,m);
    rho = zeros(n,m); u = zeros(n,m); v = zeros(n,m);
    
    %D2Q9
    w = [4/9, 1/9, 1/9, 1/9, 1/9, 1/36, 1/36, 1/36, 1/36];
    cx = [0,1,0,-1,0,1,-1,-1,1];
    cy = [0,0,1,0,-1,1,1,-1,-1];
    
    %Parameters
    u0 = u0 + epsilon; sumvel0 = 0;rho0 = 5;
    dx = 1; dy=dx; dt = 1;
    alfa = 0.01;
    Re = u0*m/alfa;
    disp(['Reynolds number = ',num2str(Re)])
    omega = 1/(3*alfa+0.5);
    
    %Initial for macroscopic
    for j=1:m
        for i=1:n
            rho(i,j) = rho0;
            u(i,j) = 0;
            v(i,j) = 0;
        end
    end
    for i=2:m-1
        u(1,i) = u0;
        v(1,i) = 0;
    end
    
    %Result settings
    x = linspace(0,L,n);
    y = linspace(0,10*H,m);
    [X,Y] = meshgrid(x,y);
    tri = delaunay(X,Y);
    
    %Main loop
    J = 0; Jbar = 0; temp = 0;
    for kk=1:mstep
        pin = 0; pout = 0;
        collision;
        streaming
        BC
        macroscopic
        %     result
        disp(kk)
        
        for j = m0+1:m
            pin = pin + rho(1,j) / 3;
        end
        for j = 1:m
            pout = pout + rho(end,j) / 3;
        end
        pin = pin/(m - m0); pout = pout/m;
        if kk > 1
            J = J + (pin - pout + temp) / 2;
        end
        temp = pin - pout;
        assert(any(any(isnan(rho)))==0)
        assert(any(any(isnan(u)))==0)
        assert(any(any(isnan(v)))==0)
    end
    Jbar = J / (mstep - 1);
    disp(Jbar)
    if epsilon==0
        dP = Jbar;
    else
        dJbar = (Jbar-dP)/epsilon;
    end
    
end
end