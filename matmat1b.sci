function [C]= matmat1b(A,B)
    n=size(A,1);
    m=size(B,2);
    p=size(B,1);
    C = zeros(m,n);
    for i = 1: n
        C(i,:) = A(i,:)*B + C(i,:);
    end
endfunction
