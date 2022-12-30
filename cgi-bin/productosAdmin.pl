#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;
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
                    $name
                    <form action='./actions/delete.pl' method='get'>
                    <input type='hidden' name='esUsuario' value='false'>
                    <input type='hidden' name='name' value='$name'>
                    <input type='submit' value='X'>
                    </form>
                    </li>";
    }
    elsif($row[0] eq "Muebles"){
        $Muebles .= "<li> 
                    $name
                    <form action='./actions/delete.pl' method='get'>
                    <input type='hidden' name='esUsuario' value='false'>
                    <input type='hidden' name='name' value='$name'>
                    <input type='submit' value='X'>
                    </form>
                    </li>";    }
    elsif($row[0] eq "Electrohogar"){
        $Electrohogar .= "<li> 
                    $name
                    <form action='./actions/delete.pl' method='get'>
                    <input type='hidden' name='esUsuario' value='false'>
                    <input type='hidden' name='name' value='$name'>
                    <input type='submit' value='X'>
                    </form>
                    </li>"; 
    }
    elsif($row[0] eq "Tecnologia"){
        $Tecnologia .= "<li> 
                    $name
                    <form action='./actions/delete.pl' method='get'>
                    <input type='hidden' name='esUsuario' value='false'>       
                    <input type='hidden' name='name' value='$name'>
                    <input type='submit' value='X'>
                    </form>
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
    <title>Document</title>
</head>
<body>
    <header>
    <a href='usuariosAdmin.pl'>Usuarios</a>
    <a href='productosAdmin.pl'>Productos</a>
    </header>

    <br>
    <a href='../addProductos.html'>Añadir Productos</a>

    <ul>
    Calzado
        <ul>
        $Calzado
        </ul>
    Muebles
        <ul>
        $Muebles
        </ul>
    Electrohogar
    <ul>
        $Electrohogar
        </ul>
    Tecnologia
        <ul>
        $Tecnologia
        </ul>
    </ul>
    
</body>
</html>
HTML
