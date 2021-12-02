exec('gausskij3b.sci');
//Tableaux des erreurs
f_err = zeros(40,1); //Erreur avant
b_err = zeros(40,1); //Erreur Arriere

for i = 1:200
    for n = 2:40
        A = rand(n,n); //Matrice A de taille n
        x = rand(n,1); //Vecteur Xinital de taille n
        b = A*x;        //Vecteur A*X
        y=gausskij3b(A,b); //Calcul de la solution Y de AY=b
        //Calcul de la valeur moyenne de l'erreur avant
        f_err(n) = f_err(n) + 0.005*norm(y-x)/norm(y);
        //Calcul de la valeur moyenne de l'erreur arriere
        b_err(n) = b_err(n) + 0.005*norm(b-A*y)/(norm(A)*norm(y));
    end 
end
//Affichage des graphique
subplot(221);
plot2d('nl',1:40,f_err,2);
xtitle("forward error of gausskij3b","taille n","log(erreu)");
subplot(222);
plot2d('nl',1:40,b_err,2);
xtitle("backward error of gausskij3b","taille n","log(erreur)");
