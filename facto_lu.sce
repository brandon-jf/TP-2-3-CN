//Jean-Francois Brandon
exec('mylu3b.sci', -1);
//Tableaux des erreurs
err = zeros(40,1); //Erreur Arriere


for i = 1:100
    for n = 2:40
        A = rand(n,n); //Matrice A de taille n

        [L,U]=mylu3b(A); //Calcul de la solution Y de AY=b
        //Calcul de la valeur moyenne de l'erreur
        err(n) = f_err(n) + 0.01*norm(A-L*U)/norm(A);
    end 
end
//Affichage des graphique
subplot(221);
plot2d('nl',1:40,err,2);
xtitle("forward error of mylu3b","taille n","log(erreu)");

err = zeros(40,1); //Erreur Arriere
for i = 1:100
    for n = 2:40
        A = rand(n,n); //Matrice A de taille n

        [L,U]=lu(A); //Calcul de la solution Y de AY=b
        //Calcul de la valeur moyenne de l'erreur
        err(n) = f_err(n) + 0.01*norm(A-L*U)/norm(A);
    end 
end
//Affichage des graphique
subplot(222);
plot2d('nl',1:40,err,2);
xtitle("forward error of lu","taille n","log(erreu)");
