#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;
use DBI;

my $q = CGI->new;
my $newname = $q->param('newname');
my $newpassword = $q->param('newpassword');

my $dsn = "DBI:mysql:database=datostienda;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "root", "") or die "No se pudo conectar";
    
my $sth = $dbh->prepare("INSERT INTO usuario(name,password)VALUES(?,?)");
$sth->execute($newname, $newpassword);
    
$dbh->disconnect;

print "Location: ../index.html \n\n";


