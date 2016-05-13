$(document).ready(function() {

  // change /questions tabs
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

  // change /questions/:id tabs
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

  // get log in fields to show
  $('.header_links:nth-child(2) a').on('click', function(){
    event.preventDefault();
    var url = $(this).attr("href");
    $.ajax({
      url: url,
    })
    .done(function(response){
      $('.header_links').remove();
      $('nav ul').append(response);
    })

    // submit a log in
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

  // submit answer on /questions/:id page
  $('form#answer_form').on('submit', function(){
    event.preventDefault();
    var form = $(this)
    var body = $('form#answer_form textarea[name=body]').val()
    var question_id = $('form#answer_form input[name=question_id]').val()
    var url = $('form#answer_form').attr('action')
    $.ajax({
      method: 'POST',
      url: url,
      data: { body: body, question_id: question_id }
    })
    .done(function(response){
      console.log("I'm done")
      // add new answer
      $('div.answer_content').append(response);
      // clear answer form
      $('form#answer_form textarea').val("")
    })

  });
});
