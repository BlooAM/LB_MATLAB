%BOUNCE BACK
%West (east side of bump)
for j=m0+1:m
    rhow = (f(1,1,j)+f(3,1,j)+f(5,1,j)+2*(f(4,1,j)+f(7,1,j)+f(8,1,j)))/(1-u0);
    f(2,1,j) = f(4,1,j) + 2*rhow*u0/3;
    f(6,1,j) = f(8,1,j) + rhow*u0/6;
    f(9,1,j) = f(7,1,j) + rhow*u0/6;
end
%South
for i=1:n
    f(3,i,1) = f(5,i,1);
    f(6,i,1) = f(8,i,1);
    f(7,i,1) = f(9,i,1);
end
%North
for i=1:n
    f(5,i,m) = f(3,i,m);
    f(9,i,m) = f(7,i,m);
    f(8,i,m) = f(6,i,m);
end

%Extrapolation outlet
for j=1:m
    f(2,n,j) = 2*f(2,n-1,j)-f(2,n-2,j);
    f(6,n,j) = 2*f(6,n-1,j)-f(6,n-2,j);
    f(9,n,j) = 2*f(9,n-1,j)-f(9,n-2,j);
end
 
%Back-facing
for i=1:n0
    f(3,i,m0) = f(5,i,m0);
    f(6,i,m0) = f(8,i,m0);
    f(7,i,m0) = f(9,i,m0);
end
for j=1:m0
    f(2,n0,j) = f(4,n0,j);
    f(6,n0,j) = f(8,n0,j);
    f(9,n0,j) = f(9,n0,j);
end