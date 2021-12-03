function [L,U]=mylu3b(A)
    n = size(A,1);
    L = eye(n,n);
    U = zeros(n,n);
    for i = 1:n-1
        U(i,:)= A(i,:)-L*U;
        L(:,i) = (1/U(i,i))*(A(:,i)-L(j,:)*U(:,i));
    end
    for k = 1:n-1
        U(n,n) = A(n,n) - L(n,k)*U(k,n);
    end
endfunction
