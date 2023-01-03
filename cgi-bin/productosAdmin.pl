#!C:/xampp/perl/bin/perl.exe -w
use strict;
use DBI;

my $dsn = "DBI:mysql:database=datostienda;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";
    
my $sth = $dbh->prepare("SELECT * FROM productos");
$sth->execute();

my $Calzado = "";
my $Muebles = "";
my $Electrohogar = "";
my $Tecnologia = "";

my $name = "";
while (my @row = $sth->fetchrow_array){
    $name = $row[1];
    if($row[0] eq "Calzado"){
        $Calzado .= "<li> 
                    <div class='item'>
                    <label>$name</label>
                    <form action='./actions/delete.pl' method='post'>
                    <input type='hidden' name='esUsuario' value='false'>
                    <input type='hidden' name='name' value='$name'>
                    <input type='submit' value='X'>
                    </form>
                    </div>
                    </li>";
    }
    elsif($row[0] eq "Muebles"){
        $Muebles .= "<li>
                    <div class='item'> 
                    <label>$name</label>
                    <form action='./actions/delete.pl' method='post'>
                    <input type='hidden' name='esUsuario' value='false'>
                    <input type='hidden' name='name' value='$name'>
                    <input type='submit' value='X'>
                    </form>
                    </div>
                    </li>";    }
    elsif($row[0] eq "Electrohogar"){
        $Electrohogar .= "<li>
                    <div class='item'> 
                    <label>$name</label>
                    <form action='./actions/delete.pl' method='post'>
                    <input type='hidden' name='esUsuario' value='false'>
                    <input type='hidden' name='name' value='$name'>
                    <input type='submit' value='X'>
                    </form>
                    </div>
                    </li>"; 
    }
    elsif($row[0] eq "Tecnologia"){
        $Tecnologia .= "<li> 
                    <div class='item'>
                    <label>$name</label>
                    <form action='./actions/delete.pl' method='post'>
                    <input type='hidden' name='esUsuario' value='false'>       
                    <input type='hidden' name='name' value='$name'>
                    <input type='submit' value='X'>
                    </form>
                    </div>
                    </li>"; 
    }    
}
 
$sth->finish();
$dbh->disconnect;

print "Content-Type: text/html\n\n";
print<<HTML;
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="../styles/general.css">
    <link rel="stylesheet" href="../styles/productos.css">
    <title>InmaduroDev Store</title>
</head>
<body>
    <div class="wrap">

     <div class="titulo">
        <h1>Administrador</h1>
        <hr>
    </div>
    <div class="elementos">
        <div class="opcionesList">
            <a class="opcion" href='usuariosAdmin.pl'>Usuarios</a>
            <a class="opcion" href='productosAdmin.pl'>Productos</a>
            <a class="opcion" href='../index.html'>Cerrar sesion</a>
        </div>

    <div class="nombresList">
        <ul>
            <li>
                <h2>Calzado</h2>
                <ul>
                $Calzado
                </ul>
            </li>
            <li>
                <h2>Muebles</h2>
                <ul>
                $Muebles
                </ul>
            </li>
            <li>
                <h2>Electrohogar</h2>
                <ul>
                $Electrohogar
                </ul>
             </li>
            <li>
                <h2>Tecnologia</h2>
                 <ul>
                $Tecnologia
                </ul>
            </li>
        </ul>
    </div>
    <div class='añadir'>
        <a href='../addProductos.html'>Añadir</a>
    </div>

    </div>
    </div>
</body>
</html>
HTML
