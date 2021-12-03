function [L,U]=mylu3b(A)
    n = size(A,1);
    L = eye(n,n);
    U = zeros(n,n);
    for i = 1:n-1
        for j = i:n
                U(i,j)= A(i,j)-L(i,:)*U(:,j);
        end
        for j = i+1:n
            L(j,i) = (1/U(i,i))*(A(j,i)-L(j,:)*U(:,i));
        end
    end
    for k = 1:n-1
        U(n,n) = A(n,n) - L(n,k)*U(k,n);
    end
endfunction
