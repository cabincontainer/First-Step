if (jQuery("#googleMap").length > 0) {
    $obj = jQuery("#googleMap");
    var myCenter = new google.maps.LatLng(16.449656, 102.749097);
    var myMaker = new google.maps.LatLng($obj.data("lat"), $obj.data("lon"));
    function initialize() {
        var mapProp = {
            center: myCenter,
            zoom: 13,
            scrollwheel: false,
            mapTypeControlOptions: {
                mapTypeIds: [ google.maps.MapTypeId.ROADMAP, "map_style" ]
            }
        };
        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
        var marker = new google.maps.Marker({
            position: myMaker,
            icon: $obj.data("icon")
        });
        marker.setMap(map);
    }
    google.maps.event.addDomListener(window, "load", initialize);
}