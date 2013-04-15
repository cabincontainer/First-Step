ManageProducts = {
	deleteSpecRow: function(){
		if (confirm("Are you sure?")){
			$(this).parents('div.specification_row').remove();
		}
	},
	addSpecRow: function(){
		var number = $('div.specification_row').length;

		var row = "<div></div>";
		row = $(row).addClass("specification_row");

		var field_div = "<div></div>";
		field_div = $(field_div).addClass("inline");

		var field = "<input></input>"
		field = $(field).addClass("field");
		field = $(field).attr("id", "specifications_"+number+"_field");
		field = $(field).attr("type", "text");
		field = $(field).attr("placeholder", "Name..");
		field = $(field).attr("name", "specifications["+number+"][field]");

		var value_div = "<div></div>";
		value_div = $(value_div).addClass("inline");

		var value = "<input></input>"
		value = $(value).addClass("field");
		value = $(value).attr("id", "specifications_"+number+"_value");
		value = $(value).attr("type", "text");
		value = $(value).attr("placeholder", "Value..");
		value = $(value).attr("name", "specifications["+number+"][value]");

		var delete_button = "<button></button>"
		delete_button = $(delete_button).addClass("delete_row");
		delete_button = $(delete_button).attr("type", "button");
		delete_button = $(delete_button).attr("namr", "button");
		delete_button = $(delete_button).text("-");

		field_div = $(field_div).append($(field));
		value_div = $(value_div).append($(value));

		row = $(row).append(field_div);
		row = $(row).append(" : ");
		row = $(row).append(value_div);
		row = $(row).append(delete_button);

		$(row).insertBefore($('div#add_new_row'));
	},
	addPhotoField: function(){
		var row = "<div></div>";
		row = $(row).addClass("photo_row");

		var div = "<div></div>";
		div = $(div).addClass("inline");

		var file_field = "<input></input>";
		file_field = $(file_field).attr("type","file");
		file_field = $(file_field).attr("name","photos[][attached_file]");

		var delete_button = "<button></button>";
		delete_button = $(delete_button).addClass("delete_photo");
		delete_button = $(delete_button).attr("type", "button");
		delete_button = $(delete_button).text("-");

		$(div).append(file_field);

		var td = $(this).parents('td.value');

		$(row).append(div);
		$(row).append(delete_button);

		$(row).insertBefore($('div#add_more_photo'));
	},
	deletePhoto: function(){
		if (confirm("Are you sure?")){
			$(this).parents('div.photo_row').remove();
		}
	},
	init: function(){
		$('button.delete_row').live('click', ManageProducts.deleteSpecRow);
		$('button.add_new_row').click(ManageProducts.addSpecRow);
		$('button.add_more_photo').click(ManageProducts.addPhotoField);
		$('button.delete_photo').live('click', ManageProducts.deletePhoto);
	}
};

var locale = window.location.pathname.split( '/' );

$(ManageProducts.init);
