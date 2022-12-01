function calcul_moyenne()
{
    var note1=prompt("Donner une premier note :");
    var note2=prompt("Donner une deuxieme note :");
    var note3=prompt("Donner une troisieme note :");

    var somme = Number(note1)*2 + Number(note2)*2 + Number(note3)*3 ;

    var moyenne= somme / 3 ;

    document.write("Voici la somme:" + somme + "          ");

    document.write("Voici la moyenne:" + moyenne);

        if(moyenne<10)
            document.write("Vous etes redoublant");
        else
            document.write("Vous etes admis");
}

function age_test()
{
    var age=prompt("Entrer votre age");
    if(age<18)
        document.write("Vous etes mineur");
    else
        document.write("Vous etes majeur");
}

function simple_affichage()
{
    var nom=prompt("Quel est votre nom ?");
    var prenom=prompt("Quel est votre prenom ?");

    document.write("<div style='background-color:StateBlue; border:2px solid blue;height:30px;")
    document.write("<p1 style'color:red;>Bonjour "+ prenom+"   "+ nom+"</p1>");
    document.write("</div>")
}

function test_color()
{
    var couleur = prompt("Donner une couleur");
    if (couleur == "rouge")
        document.body.style.background="red"
        else if (couleur == "bleu")
        document.body.style.background="blue"
        else if (couleur == "vert")
        document.body.style.background="green"
        else
        alert("couleur inconnue ! .....")

}

function somme()
{
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var p = Number (a) + Number (b);


    t3.value=p;
}

function soustraction()
{
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var p = Number (a) - Number (b);


    t3.value=p;
}

function produit()
{
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var p = Number (a) * Number (b);


    t3.value=p;
}

function division()
{
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var p = Number (a) / Number (b);


    t3.value=p;
}

function parite()
{
    var x = Number(document.getElementById("t1").value);
    if(x % 2 == 0)
    alert("Le nombre est pair");
    else
    alert("Le nombre est impair");
}