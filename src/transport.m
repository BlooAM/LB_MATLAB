clear
clc

%Grid
m = 101; n = 101; q = 9;
mstep = 10;

%D2Q9
w = [4/9, 1/9, 1/9, 1/9, 1/9, 1/36, 1/36, 1/36, 1/36];
e = [0,0;1,0;0,1;-1,0;0,-1;1,1;-1,1;-1,-1;1,-1];

%Parameters
u = 0.1; v = 0.4;
dx = 1; dt = 1; dy = dx;
alfa = 1; tw = 1;
ck = dx/dt; csq = ck*ck;
omega = 1/(3*alfa/(csq*dt)+0.5);
density = 0;

%Containers
f = zeros(q,n,m); feq = zeros(q);
rho = zeros(n,m);
x = [1:n]; y = [1:m];

for j=1:m
    for i=1:n
        for k=1:q
            f(k,i,j) = w(k)*density;
            if(i==1)
                f(k,i,j) = w(k)*tw;
            end
        end
    end
end

%Main  loop
for kk=1:mstep
    
    %Calculate density
    for j=1:m
        for i=1:n
            sum = 0;
            for k=1:q
                sum = sum+f(k,i,j);
            end
            rho(i,j) = sum;
        end
    end
%     disp(rho(1,m/2))
    
    %Calculate equlibrium
    for j=1:m
        for i=1:n
            feq(1) = w(1)*rho(i,j);
            feq(2) = w(2)*rho(i,j)*(1+3*u/ck);
            feq(3) = w(3)*rho(i,j)*(1+3*v/ck);
            feq(4) = w(4)*rho(i,j)*(1-3*u/ck);
            feq(5) = w(5)*rho(i,j)*(1-3*v/ck);
            feq(6) = w(6)*rho(i,j)*(1+3*(u+v)/ck);
            feq(7) = w(7)*rho(i,j)*(1+3*(-u+v)/ck);
            feq(8) = w(8)*rho(i,j)*(1-3*(u+v)/ck);
            feq(9) = w(9)*rho(i,j)*(1+3*(u-v)/ck);
            
            %Collision step
            for k=1:q
                f(k,i,j) = omega*feq(k)+(1-omega)*f(k,i,j);
            end
            
        end
    end
    
    %Streaming step - check indexes!!!
    for j=m:-1:2 
        for i=1:n-1
            f(3,i,j) = f(3,i,j-1);
            f(7,i,j) = f(7,i+1,j-1);
        end
    end
    for j=m:-1:2 
        for i=n:-1:2 
            f(2,i,j) = f(2,i-1,j);
            f(6,i,j) = f(6,i-1,j-1);
        end
    end
    for j=1:m-1 
        for i=n:-1:2 
            f(5,i,j) = f(5,i,j+1);
            f(9,i,j) = f(9,i-1,j+1);
        end
    end
    for j=1:m-1 
        for i=1:n-1 
            f(4,i,j) = f(4,i+1,j);
            f(8,i,j) = f(8,i+1,j+1);
        end
    end
    
    %Boundary conditions
    
end