function [C]= matmat3b(A,B)
    n=size(A,1);
    m=size(B,2);
    p=size(B,1);
    C = zeros(m,n);
    for i = 1: n
        for j = 1:m;
            for k = 1:p;
                C(i,j) = A(i,k)*B(k,j) + C(i,j);
            end
        end
    end
endfunction

