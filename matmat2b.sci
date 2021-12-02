function [C]= matmat2b(A,B)
    n=size(A,1);
    m=size(B,2);
    p=size(B,1);
    C = zeros(m,n);
    for i = 1: n
        for j = 1:m;
            C(i,j) = A(i,:)*B(:,j) + C(i,j);
        end
    end
endfunction
