$(function(){

  $("a").on('click', function(e){
    e.preventDefault()
    $("article").hide().filter("[data-block=" + $(this).attr('data-block') + "]").show();
  })

  // how the magic works

  var gold = document.getElementById("gold");
  gold.dataset.block = 'silver';
  console.log(gold.dataset)
})