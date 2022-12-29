#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;
use DBI;

my $q = CGI->new;
my $name = $q->param('name');

my $dsn = "DBI:mysql:database=datostienda;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";
    
my $sth = $dbh->prepare("DELETE FROM usuario WHERE name=?");
$sth->execute($name);

$sth->finish();
$dbh->disconnect;

print "Location: ../inicioAdmin.pl \n\n";
