function resultat()

{

    var a = document.getElementById("n1").value;
    var b = document.getElementById("n2").value;
    var c = document.getElementById("n3").value;

    var d = document.getElementById("c1").value;
    var e = document.getElementById("c2").value;
    var f = document.getElementById("c3").value;

    var g = document.getElementById("m1").value;
    var h = document.getElementById("m2").value;

    var somme = Number(a) * Number(d) + Number(b) * Number(e) +Number(c) * Number(f);
    var coef = Number(d)+ Number(e)+ Number(f)

    var tkt = somme / coef;
    m1.value=tkt;

 

    if(tkt<10)

        m2.value = ("Redoublant");

    else if(tkt<15)

        m2.value = ("Admis");

    else

        m2.value = ("Admis Bien");  

}
