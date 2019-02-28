%Clear MATLAB workspace
clear
clc

%Grid
m = 80; n = 25*m; q = 9;
p = 0.5; m0 = p*m; n0 = m; %Bump
mstep = 4000;
L = 50; H = 2;

%Containers
f = zeros(q,n,m); feq = zeros(q,n,m);
rho = zeros(n,m); u = zeros(n,m); v = zeros(n,m);

%D2Q9
w = [4/9, 1/9, 1/9, 1/9, 1/9, 1/36, 1/36, 1/36, 1/36];
cx = [0,1,0,-1,0,1,-1,-1,1];
cy = [0,0,1,0,-1,1,1,-1,-1];

%Parameters
u0 = 0.1; sumvel0 = 0;rho0 = 5;
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
 
video1 = VideoWriter('velocity.avi');
open(video1)
% video2 = VideoWriter('rho.avi');
% open(video2)
% video3 = VideoWriter('u.avi');
% open(video3)
% video4 = VideoWriter('v.avi');
% open(video4)

%Main loop
for kk=1:mstep
    
    collision
    streaming
    BC
    macroscopic
    result
    disp(kk)
    
    assert(any(any(isnan(rho)))==0)
    assert(any(any(isnan(u)))==0)
    assert(any(any(isnan(v)))==0)
end

close(video1)
% close(video2)
% close(video3)
% close(video4)