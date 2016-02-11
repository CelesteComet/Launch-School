$(function(){
  var $blinds = $("div[id^='blind']");

  startComic();

  $('a').on('click', function(e){
    e.preventDefault();
    $blinds.finish();
    $blinds.removeAttr('style');
    startComic();
  })

  function startComic(){
    var speed = 250;
    var delay = 1500;
    $blinds.each(function(i){
      var $blind = $blinds.eq(i);
      $blind.delay(delay).animate({
        top: Number($blind.css('top').replace('px','')) + $(this).height(),
        height: 0
      },speed)
      delay += 1500;
    })
  }

})