#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;
use DBI;

my $q = CGI->new;
my $category = $q->param('category');
my $name = $q->param('name');
my $price = $q->param('price');
my $imageURL = $q->param('imageURL');

my $dsn = "DBI:mysql:database=datostienda;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "root", "") or die "No se pudo conectar";
    
my $sth = $dbh->prepare("INSERT INTO productos VALUES (?, ?, ?, ?)");
$sth->execute($category, $name, $price, $imageURL);
    
$dbh->disconnect;

print "Location: ../productosAdmin.pl \n\n";
