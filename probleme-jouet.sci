//TP Matrice random et probléme "jouet"
//Jean-francois Brandon

//Matrice A de taille 3x3 a valeurs aléatoire
A = rand(3,3);
disp(A);
//vecteur xex de dimension 3 à valeurs aléatoire
xex = rand(3,1);
disp(xex);
//Produit matrice vecteur de A et xex
b = A * xex;
disp(b);
//Resolution du système avec la fonction backslash "\"
x = A\b;
disp(x);
//Calcul de l'erreur avant 
forward_error = 0.0;
forward_error = norm(x-xex)/norm(xex);
disp(forward_error);
// Calcul de l'erreur arriere
backward_error = norm(b-A*x)/(norm(A)*norm(x));
disp(backward_error);  
f_err = zeros(3,1);
b_err = zeros(3,1);
i = 1;
for n = [10, 100, 1000]
    A = rand(n,n);
    xex = rand(n,1);
    b = A * xex;
    x = A\b;
    f_err(i) =  norm(x-xex)/norm(xex);
    b_err(i) =  norm(b-A*x)/norm(A)*norm(x);
    i = i+1;
end
abscisse = [10, 100, 1000];
xset("line style",2);
plot2d('ll',abscisse,f_err,style = 2);
xset("line style",3);
plot2d('ll',abscisse,b_err, style =5);
xtitle("Erreurs de backslash en echelle logarthmique", "log(n)","log(err)");
legends(["forward error";"backward error"],[[2;2],[5;3]],opt="ul");
