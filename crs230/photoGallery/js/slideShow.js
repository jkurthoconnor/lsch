$(document).ready(function(e) {
  var $mainImg = $('figure > img');
  var $thumbnails = $('li > img');

  $thumbnails.on('click', function(e) {
    var current;

    $thumbnails.filter('.active').removeClass('active');
    $(e.target).addClass('active'); 

    current = $thumbnails.filter('.active');
    $mainImg.attr('src', current.attr('src'));
  });
});
