$(function(){

  var $title = $("h1").remove();
  var $section = $("section[id='content']").remove();
  var $figcaps = $("figcaption").remove();

  $("body").prepend($("header"));
  $("header").prepend($title);
  $("main").prepend($section);
  $("section").prepend($("article"));

  




});