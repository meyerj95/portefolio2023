function affichagetab()
{
    document.write('<table border=2px width=30%');
    for(let i = 0 ; i <= 5; i++){
        document.write('<tr><td>*</td><td>*</td><td>*</td></tr>');
    }
    document.write('</table<');
}

function affichagetab2()
{

    var ligne = prompt("Nombre de colonnes : ")
    document.write('<table border=2px width=30%');
    for(let i = 1 ; i <= ligne; i++){
        document.write('<tr><td>'+i+'</td><td>*</td><td>*</td></tr>');
    }
    document.write('</table<');
}

function seconnecter()
{
    var user = prompt ("Nom d'utilisateur");
    var mdp = prompt ("Mot de passe"); 

    if (user == "admin" && mdp == "admin" ){
        document.write("Bienvenue : "+user);
    }
    else{
        alert("Accès refusé");
    }
}

function seconnecter2(){
    var i = 0;
    do{
        var id = prompt("Donner votre nom d'utilisateur");
        var mdp = prompt("Entrez votre nom d'utulisateut");
        if (id=="admin" && mdp =="admin")
        {
            document.write("Bienvenue :    "+id);
            break;
        }
        else
        alert("Acces refusé");
        i+=1;
    } while (i<3);
    if (i==3)
    alert("Delai dépasseé")
}

function cdc()
{
    var chaine = prompt("Donnez un mot");
    document.write(chaine.toUpperCase()+"<br>");
    document.write(chaine.toLowerCase()+"<br>");
    document.write("La chaine contient     "+chaine.length+" caractères    "+"<br>");
    document.write("La premiere lettres est     " + chaine.substr(0,1)+"<br>");

}

function color()
{

    var color = prompt ("Entrez une couleur");
    switch(color)
    {
        case"rouge" : document.body.style.backgroung = "red";
        break;
        case"ROUGE" : document.body.style.backgroung = "red";
        break;
        case"BLEU" : document.body.style.backgroung = "blue";
        break;
        case"bleu" : document.body.style.backgroung = "blue";
        break;

        default:alert("Couleur non définie");
    }
}

function bonus()
{   Tf=0
    do 
    {
        var article=prompt("saisir l'article")
        var Pa=prompt("saisir le prix")
        var Qa=prompt("saisir la quantité")
        var produit = Number(Pa)*Number(Qa);
        alert("Voici le prix de l'article:     "+ produit + "   ");
        Tf=Tf + produit;
        alert("Voici le prix total a payer:  "+Tf+" ")
        var msg=prompt("pour continuer entrer un caractère pour areter entrer STOP");




    } while (msg != "STOP");
    document.write("Ticket de Caisse :  <br/> <br/> <br/>");
    document.write(article)
    document.write("Voici le prix total a payer:     "+ Tf + "   ");
    
    
}