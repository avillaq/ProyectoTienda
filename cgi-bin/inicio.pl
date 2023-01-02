#!C:/xampp/perl/bin/perl.exe -w
use strict;
use DBI;

#Link del video
#https://www.youtube.com/watch?v=UH7Xtn4J5ZM

#Productos sacados de https://juntoz.com/

my $dsn = "DBI:mysql:database=datostienda;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";
    
my $sth = $dbh->prepare("SELECT * FROM productos");
$sth->execute();
my $ListaProductos = "";

while (my @row = $sth->fetchrow_array){
    $ListaProductos .= "<div class='product-item' category=$row[0]>
                <img src=$row[3] alt=''>
                <p class='nombre'>$row[1]</p>
                <p class='precio'>S/ $row[2]</p>
                <p class='comprar' precio=$row[2]>Añadir al carrito</p>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!- Para eliminar cache y se apliquen los cambios en la pagina ->
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Last-Modified" content="0">
    <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
    <meta http-equiv="Pragma" content="no-cache">


    <title>InmaduroDev Store</title>
    
    <link rel="stylesheet" href="../styles/style.css">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script src="../script/script.js"></script>
</head>
<body>
    <div class="wrap">
        <h1>InmaduroDev Store</h1>
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
            <div class='shopping'>
                 <div class="carrito">
                    <img src="https://cdn-icons-png.flaticon.com/128/7168/7168070.png" alt="">
                    <p id="totalCompras">S/ 0.0</p>
                 </div>
                <a href="#" onclick="alert('Gracias por su compra')">Procesar Compra</a>
                <a href="../index.html">Cerrar Sesion</a> 
            </div>
        </div>
    </div>
    
</body>
</html>
HTML