$(document).ready(function() {

  $('.container > .tabs a').on('click', function(event){
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

  $('.answer_sort .tabs a').on('click', function(event){
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
      $('div.answer_content').empty().append(div)
    })
  });

  $('.header_links:nth-child(2) a').on('click', function(){
    event.preventDefault();
    var url = $(this).attr("href");
    console.log(this)
    console.log(url)
    $.ajax({
      url: url
    })
    .done(function(response){
      $('.header_links').remove();
      $('nav ul').append(response);
    })

  });
});
