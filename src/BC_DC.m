%BOUNCE BACK
for j=1:m
    %West
    f(2,1,j) = f(4,1,j);
    f(6,1,j) = f(8,1,j);
    f(9,1,j) = f(7,1,j);
    
    %Eeast
    f(4,n,j) = f(2,n,j);
    f(8,n,j) = f(6,n,j);
    f(7,n,j) = f(9,n,j);
end

for i=1:n
    %South
    f(3,i,1) = f(5,i,1);
    f(6,i,1) = f(8,i,1);
    f(7,i,1) = f(9,i,1);
end

%MOVING LID
for i=1:n-1
    %North
    rhon = f(1,i,m)+f(2,i,m)+f(4,i,m)+2*(f(3,i,m)+f(7,i,m)+f(6,i,m));
    f(5,i,m) = f(3,i,m);
    f(9,i,m) = f(7,i,m)+rhon*u0/6;
    f(8,i,m) = f(6,i,m)-rhon*u0/6;
end
