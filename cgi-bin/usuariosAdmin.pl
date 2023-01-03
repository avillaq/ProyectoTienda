#!C:/xampp/perl/bin/perl.exe -w
use strict;
use DBI;

my $dsn = "DBI:mysql:database=datostienda;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";
    
my $sth = $dbh->prepare("SELECT name FROM usuario");
$sth->execute();
 
my $Namelist = "";
while (my @row = $sth->fetchrow_array){
    my $name = $row[0];

    if($name ne "admin"){
       $Namelist .= "<li>
                    <div class='item'>
                    <label>$name</label>
                    <form action='./actions/delete.pl' method='post'>
                    <input type='hidden' name='esUsuario' value='true'>
                    <input type='hidden' name='name' value='$name'>
                    <input type='submit' value='X'>
                    </form>
                    </div>
                    </li>";
    }
    else{
        $Namelist .= "<li>
                    <div class='item'>
                    <label>$name</label> 
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
    <link rel="stylesheet" href="../styles/usuarios.css">
    <title>Document</title>
</head>
<body>
    <div class="wrap">

     <div class="titulo">
        <h1>Bienvenido</h1>
        <hr>
    </div>
    <div class="elementos">
        <div class="opcionesList">
            <a class="opcion" href='usuariosAdmin.pl'>Usuarios</a>
            <a class="opcion" href='productosAdmin.pl'>Productos</a>
            <a class="opcion" href='../index.html'>Cerrar sesion</a>
        </div>
        <div class="nombresList">
            <ul>$Namelist</ul>
        </div>
    </div>
        
    </div>
    
    
</body>
</html>
HTML
