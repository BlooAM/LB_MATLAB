for j=1:m
    for i=1:n
        ssum = 0;
        for k=1:q
            ssum = ssum+f(k,i,j);
        end
        rho(i,j) = ssum;
    end
end

for i=1:n
    rho(i,m) = f(1,i,m)+f(2,i,m)+f(4,i,m)+2*(f(3,i,m)+f(7,i,m)+f(6,i,m));
end

for i=1:n
    for j=1:m-1
        usum = 0;
        vsum = 0;
        for k=1:q
            usum = usum+f(k,i,j)*cx(k);
            vsum = vsum+f(k,i,j)*cy(k);
        end
        u(i,j) = usum/rho(i,j);
        v(i,j) = vsum/rho(i,j);
    end
end

for j=1:m
    v(n,j) = 0;
end
for j=1:m0
    for i=1:n0
        u(i,j)=0;
        v(i,j)=0;
    end
end