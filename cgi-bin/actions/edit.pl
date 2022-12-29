#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;
use DBI;

my $q = CGI->new;
my $editname = $q->param('editname');

my $dsn = "DBI:mysql:database=datostienda;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";
    
my $sth = $dbh->prepare("UPDATE usuario SET name = ? WHERE name = ?");
$sth->execute($newname, $newpassword);
    
$dbh->disconnect;

print "Location: ../index.html \n\n";