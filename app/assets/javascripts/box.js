//Queremos capturar los clicks sobre las cartas
//function es el parametro y la funcion es $, funcion  de JQuery

//ADD_ITEM To Box
$(document).on('click', ".add-product-box", function(ev){

	var $product = $(this);

	ev.preventDefault();
	var sourceUrl = 'add_item';
	
	//Ahora hacemos el llamado AJAX a esta dirección, hay dos sintaxis para método .ajax
	$.ajax({
		url: sourceUrl,
		data: {"product-id" : $product.data('productId')},
		dataType:'JSON',
		//Ver documentacion JQuery ajax para success
		"success": function(data,ts, jg){
			console.log("SUCCESS!", data, ts, jg);
			//Agregamos la información obtenida llamando a funcion construida por nos mas abajo
			addItemTagBox(data);

		},
		"error": function(jg, st, er){
			console.log("Error: (", jg, st, er);
		}
	});


	//Ahora funcion que construye HTML en base a lo rescatado por AJAX
	var addItemTagBox = function(productInfo) {
		$add = $('<label class="form-control remove-product-box"' + 
				' data-product-id=' + productInfo.id + ' id=' + productInfo.name +
				" for=box_" + productInfo.name + ">" + productInfo.name +
				'</label>');


		$('#'+productInfo.name).remove();
		$('.already_in_box').find('.panel_contents').append($add);
	}
});

//------------------------------------------------------------------------------------------//

//REMOVE_ITEM from Box

$(document).on('click', ".remove-product-box", function(ev){

	var $product = $(this);

	ev.preventDefault();
	var sourceUrl = 'remove_item';

	//Ahora hacemos el llamado AJAX a esta dirección, hay dos sintaxis para método .ajax
	$.ajax({
		url: sourceUrl,
		data: {"product-id" : $product.data('productId')},
		dataType:'JSON',
		//Ver documentacion JQuery ajax para success
		"success": function(data,ts, jg){
			console.log("SUCCESS!", data, ts, jg);
			//Agregamos la información obtenida llamando a funcion construida por nos mas abajo
			removeItemTagBox(data);

		},
		"error": function(jg, st, er){
			console.log("Error: (", jg, st, er);
		}
	});

	//Ahora funcion que construye HTML en base a lo rescatado por AJAX
	var removeItemTagBox = function(productInfo) {
		$add = $('<label class="form-control add-product-box"' + 
				' data-product-id=' + productInfo.id + ' id=' + productInfo.name +
				" for=box_" + productInfo.name + ">" + productInfo.name +
				'</label>');

		$('#'+productInfo.name).remove();
		$('.not_in_box').find('.panel_contents').append($add);
	}
});





