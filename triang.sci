//cd("TP/Scilab version/");
exec('lsolv.sci',-1);
f_err = zeros(100,1);
b_err = zeros(100,1);
//duree_l = zeros(100,1);
//duree_u = zeros(100,1);
for i=1:100 
    for n = 2:100
        A = tril(rand(n,n));
        xs= rand(n,1);
        y=A*xs;
        tic();
        xc = lsolv(A,y);
        f_err(n) = f_err(n)+0.01*norm(xs - xc)/ norm(xs);
        b_err(n) = b_err(n)+0.01*norm(y - A*xc)/(norm(A)*norm(xc));
    end
end
subplot(221);
plot2d('nl',1:100,[f_err;b_err],[2,5]);
xtitle("forward and backward error of lsolv");
subplot(222);
plot2d('nl',1:100,duree_l,1);
xtitle("backward error of lsolv");

exec('usolv.sci',-1);
f_err = zeros(n,1);
b_err = zeros(n,1);
for i=1:100
    for n = 2:100
        A = triu(rand(n,n));
        xs= rand(n,1);
        y=A*xs;
        xc = usolv(A,y);
        f_err(n) = f_err(n) + 0.01*norm(xs - xc)/ norm(xs);
        b_err(n) = b_err(n) + 0.01*norm(y - A*xc)/(norm(A)*norm(xc));
    end
end
subplot(223);
plot2d('nl',1:100,f_err,3);
xtitle("forward error of usolv");
subplot(224);
plot2d('nl',1:100,b_err,3);
xtitle("backward error of usolv");
subplot(225);
duree_l = zeros(4,1);
duree_u = zeros(4,1);
for i = 1:100
    for n = [10, 100,500,1000 ]
        A = rand(n,n);
        xs= rand(n,1);
        y=triu(A)*xs;
        tic();
        xc = usolv(triu(A),y);
        duree_u(i) = duree_u(i) + 0.01*toc();
        y=tril(A)*xs;
        tic();
        xc= lsolv(tril(A),y);
        duree_l(i) = duree_l(i) + 0.01*toc();
    end
end
plot2d('ll',log([10,100,500,1000]),duree_l,2);
plot2d('ll',log([10,100,500,1000]),duree_u,5);
xtitle("duree");
