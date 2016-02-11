$(function(){
  $canvas = $('#canvas');


  function getFromObject($f){

    var o = {};
    var array = $f.serializeArray();

    array.forEach(function(input){
      o[input.name] = input.value;
    })

    return o;
  }

  function createElement(data){
    var $div = $('<div/>', {
      data: data,
      'class': data.shape,
       css: {
        left: +data.startx,
        top: +data.starty
      }
    })
    return $div
  }

  function animateElement(){
    var $e = $(this);
    var data = $e.data()
    $e.animate({
      left: +data.endx,
      top: +data.endy
    },4000)
  }

  $("form").on("submit", function(e){
    e.preventDefault();
    $form = $('form')
    data = getFromObject($form)
    $canvas.append(createElement(data));
  })

  $("#start").on('click', function(e){
    e.preventDefault();
    $all = $canvas.find("div");
    $all.each(animateElement);
  })

  $("#stop").on('click', function(){
    $canvas.find("div").stop();
  })
})