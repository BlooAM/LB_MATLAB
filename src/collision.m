for i=1:n
    for j=1:m
        t1 = u(i,j)*u(i,j)+v(i,j)*v(i,j);
        for k=1:q
            t2 = u(i,j)*cx(k)+v(i,j)*cy(k);
            feq(k,i,j) = rho(i,j)*w(k)*(1+3*t2+4.5*t2*t2-1.5*t1);
            f(k,i,j) = omega*feq(k,i,j)+(1-omega)*f(k,i,j);
        end
    end
end