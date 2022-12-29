#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;
use DBI;

my $dsn = "DBI:mysql:database=datostienda;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";
    
my $sth = $dbh->prepare("SELECT name FROM usuario");
$sth->execute();

my @row = $sth->fetchrow_array;
while (my @as = $sth->fetchrow_array){
    print @as;
}
$sth->finish();
$dbh->disconnect;



my $list = list_users(@row);

print<<HTML;
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <a href="inicioAdmin.pl">Usuarios</a>
    <ul>$list</ul>
    
</body>
</html>
HTML

sub list_users{
my $Namelist = "";
foreach my $i (@_){
    
    $Namelist .= "<li> 
                    $i 
                    <form action='./actions/edit.pl' method='get'>
                    <input type='hidden' name='$i' value='$i'>
                    <input type='submit' value='Editar'>
                    </form>";
    if($i ne "admin"){
       $Namelist .= "<form action='./actions/delete.pl' method='get'>
                    <input type='hidden' name='$i' value='$i'>
                    <input type='submit' value='X'>
                    </form>";
    }
    $Namelist .= "</li><br>";                 

}
return $Namelist;
}