//= require jquery.fancybox.js

Globals = {
  init: function(){
	$('.bxslider').bxSlider({
	  auto: true,
	  mode: 'fade',
	  randomStart: true
	});

	//Show Clock
	$('#analog-clock').clock({offset: '+7', type: 'analog'});
	//End Clock

	if($('a.fancy_link').length > 0){
      $('a.fancy_link').fancybox({
        showCloseButton     : true,
        hideOnOverlayClick  : true,
        padding             : 0,
        openEffect          : 'elastic',
        openSpeed           : 300,
        closeEffect         : 'elastic',
        closeSpeed          : 300,
        closeClick          : false,
        overlayShow			: true
      });
    }

  	var category_id = $("#middle_layout").find("h5").attr("category-id");
  	var cat_id = $("a[cat_id='"+category_id+"']").parents(".products-link").addClass("left-link-active");
  }
};

var locale = window.location.pathname.split( '/' );

$(Globals.init);