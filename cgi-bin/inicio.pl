#!C:/xampp/perl/bin/perl.exe -w
use strict;
use DBI;

#Link del video
#https://www.youtube.com/watch?v=UH7Xtn4J5ZM

my $dsn = "DBI:mysql:database=datostienda;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";
    
my $sth = $dbh->prepare("SELECT * FROM productos");
$sth->execute();
my $ListaProductos = "";

while (my @row = $sth->fetchrow_array){
    $ListaProductos .= "<div class='product-item' category=$row[0]>
                <img src=$row[3] alt=''>
                <a href='#'>$row[1]</a>
                </div>"; 
}
 
$sth->finish();
$dbh->disconnect;

print "Content-Type: text/html\n\n";
print<<HTML;
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mi tienda</title>
    
    <link rel="stylesheet" href="../styles/style.css">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script src="../script/script.js"></script>
</head>
<body>
    <div class="wrap">
        <h1>InmaduroDev</h1>
        <div class="store-wrap">
            <div class="category_list">
                <a href="#" class="category_item" category="all">Todo</a>
                <a href="#" class="category_item" category="Calzado">Calzado</a>
                <a href="#" class="category_item" category="Muebles">Muebles</a>
                <a href="#" class="category_item" category="Electrohogar">Electrohogar</a>
                <a href="#" class="category_item" category="Tecnologia">Tecnologia</a>
            </div>
            <section class="products_list">
                $ListaProductos
            </section>
        </div>
    </div>
    
</body>
</html>
HTML