#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;
use DBI;

my $dsn = "DBI:mysql:database=datostienda;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";
    
my $sth = $dbh->prepare("SELECT * FROM productos");
$sth->execute();

while (my @row = $sth->fetchrow_array){
    print @row."\n";
}
 
=pod
my $Namelist = "";
my @array;
my $i = 0;
while (my @row = $sth->fetchrow_array){
    $array[$i] = $row[0];
    my $name = $row[0];

    if($name ne "admin"){
       $Namelist .= "<li> 
                    $name
                    <form action='./actions/delete.pl' method='get'>
                    <input type='hidden' name='name' value='$name'>
                    <input type='submit' value='X'>
                    </form>
                    </li>";
    }
    else{
        $Namelist .= "<li>$name</li>";
    }

    $i++;
}
=cut
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

    </header>
    <ul></ul>
    
</body>
</html>
HTML
