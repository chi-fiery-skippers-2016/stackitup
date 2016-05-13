$(document).ready(function() {

  $('.tabs a').on('click', function(event){
    event.preventDefault();
    var li = $(this).parent();
    var $current = $('.active');
    li.addClass('active');
    $current.removeClass('active');
    var url = $(this).attr('href');

    $.ajax({
      url: url,
      type: 'GET'
    })
    .done(function(sorted){
      var div = sorted
      $('div.tab-content').empty().append(div)
    })
  });

});
