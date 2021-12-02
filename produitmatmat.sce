//mesure 
exec("matmat3b.sci");
exec("matmat2b.sci");
exec("matmat1b.sci");
a= 0;
b = 0;
n = 10;
temps=zeros(100,3);
for n = 2:100
    A = rand(n,n);
    B = rand(n,n);
    tic();
    C = matmat1b(A,B);
    temps(n,1)=toc();
    tic();
    C = matmat2b(A,B);
    temps(n,2) = toc();
    tic();
    C = matmat3b(A,B);
    temps(n,3)=toc();
end


xset("line style",2);
plot2d('ll',2:100,temps(2:100,1),style=3);
xset("line style",2);
plot2d('ll',2:100,temps(2:100,2),style=2);
xset("line style",2);
plot2d('nl',2:100,temps(2:100,3),style=5);
xtitle("durée d execution de multiplication matriciel ", "taille n","durée (s)");
legends(["matmat1b";"matmat2b";"matmat3b"],[[3;2],[2;2],[5;2]],opt="ul");
