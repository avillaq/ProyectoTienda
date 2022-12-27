#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;

my $q = CGI->new;

my $name = $q->param('name');

print $q->header('text-html');
print<<HTML;
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Titulo</title>
</head>
<body>
    hola $name
</body>
</html>
HTML