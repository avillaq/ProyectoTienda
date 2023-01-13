#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;
use DBI;

my $q = CGI->new;
my $name = $q->param('name');
my $esUsuario = $q->param('esUsuario');


my $dsn = "DBI:mysql:database=datostienda;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "root", "") or die "No se pudo conectar";

if($esUsuario eq "true") {
    my $sth = $dbh->prepare("DELETE FROM usuario WHERE name=?");
    $sth->execute($name);
    $sth->finish();
    $dbh->disconnect;
    print "Location: ../usuariosAdmin.pl \n\n";
}
else {
    my $sth = $dbh->prepare("DELETE FROM productos WHERE name=?");
    $sth->execute($name);
    $sth->finish();
    $dbh->disconnect;
    print "Location: ../productosAdmin.pl \n\n";

}



