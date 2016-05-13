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
      url: url,
    })
    .done(function(response){
      $('.header_links').remove();
      $('nav ul').append(response);
    })

    $('body').on('submit', '#wabam', function(event){
      event.preventDefault();
      email = $('#wabam input[name=email]').val()
      password = $('#wabam input[name=password]').val()
      title = $('.body_container h2').html();
      var url = $('#wabam').attr("action");
      console.log(url);
      $.ajax({
        method: "POST",
        url: url,
        data: { title: title, email: email, password: password }
      })
      .done(function(response){
        $('body').remove();
        $('html').append(response);
      })
    })
  });

  $('form#answer_form').on('submit', function(){
    body = $('form#answer_form textarea[name=body]').val()
    question_id = '?'
    url = $('form#answer_form').attr('action')
    $.ajax({
      method: 'POST',
      url: url,
      data: { body: body }
    })
    .done(function(response){
      // add new answer
      // clear answer form
    })

  });
});
