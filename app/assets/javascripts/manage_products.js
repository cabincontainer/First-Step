ManageProducts = {
	filterProducts: function(){
		var filter_value = $(this).val();
		$(".product-list").isotope({ filter: filter_value })
	},
	addMoreImageField: function(){
		var new_image_field = $(".blueprint").clone();

		$(new_image_field).removeClass("blueprint");
		$(new_image_field).insertBefore($(".add-image-button"));
	},
	addPhotoField: function(){
		var row = "<div></div>";
		row = $(row).addClass("masonry-item col-md-4 col-sm-6 product photo_row pt-2 pb-2");

		var file_field = "<input></input>";
		file_field = $(file_field).attr("type","file");
		file_field = $(file_field).attr("name","photos[][attached_file]");
		file_field = $(file_field).addClass("form-control");

		var delete_button = "<button></button>";
		delete_button = $(delete_button).addClass("delete_photo button");
		delete_button = $(delete_button).attr("type", "button");
		delete_button = $(delete_button).text("ลบ");

		$(row).append(file_field);
		$(row).append(delete_button);

		$(row).insertBefore($('div#add_more_photo'));
	},
	deletePhoto: function(){
		if (confirm("ยืนยันลบภาพนี้?")){
		  $(this).parents('div.photo_row').remove();
		}
	},
	init: function(){
		$('button.add_more_photo').click(ManageProducts.addPhotoField);
		$('button.delete_photo').live('click', ManageProducts.deletePhoto);

		$(".product-list").isotope({ filter: '*' })

		$("#filter_by").change(ManageProducts.filterProducts);

		$("#add-more-image").click(ManageProducts.addMoreImageField);
	}
};

var locale = window.location.pathname.split( '/' );

$(ManageProducts.init);
