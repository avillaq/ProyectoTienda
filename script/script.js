//Link del video
//https://www.youtube.com/watch?v=UH7Xtn4J5ZM
//
$(document).ready(function(){
    // Creando clase active al primer enlace
    $('.category_list .category_item[category="all"]').addClass('ct_item-active');

    $('.category_item').click(function(){
        var catProduct = $(this).attr('category');
        
        $('.category_item').removeClass('ct_item-active');
        $(this).addClass('ct_item-active');

        //Ocultando el producto
        $('.product-item').hide();

        //Mostrar el producto
        $('.product-item[category="'+catProduct+'"]').show();
    });
    $('.category_item[category="all"]').click(function() {
        $('.product-item').show();
    });
});

