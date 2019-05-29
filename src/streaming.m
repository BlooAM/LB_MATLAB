for j=1:m
    % right -> left
    for i=n:-1:2
        f(2,i,j) = f(2,i-1,j);
    end
    
    % left -> right
    for i =1:n-1
        f(4,i,j) = f(4,i+1,j);
    end
end

for j=m:-1:2    
    % top -> bottom
    for i=1:n
        f(3,i,j) = f(3,i,j-1);
    end
    for i=n:-1:2
        f(6,i,j) = f(6,i-1,j-1);
    end
    for i=1:n-1
        f(7,i,j) = f(7,i+1,j-1);
    end
end

for j=1:m-1
    % bottom->top
    for i=1:n
        f(5,i,j) = f(5,i,j+1);
    end
    for i=1:n-1
        f(8,i,j) = f(8,i+1,j+1);
    end
    for i=n:-1:2
        f(9,i,j) = f(9,i-1,j+1);
    end
end