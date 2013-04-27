Globals = {
  init: function(){
	$('.bxslider').bxSlider({
	  auto: true
	});

  	var category_id = $("#middle_layout").find("h5").attr("category-id");
  	var cat_id = $("a[cat_id='"+category_id+"']").parents(".products-link").addClass("left-link-active");
  }
};

var locale = window.location.pathname.split( '/' );

$(Globals.init);