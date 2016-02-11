$(function(){
  var post = {
    tags: ['awesome','exciting','street fighter'],
    title: "Vega In SFV!",
    date: (new Date()).toUTCString(),
    body: "<strong>Vega is now in Street Fighter V.</strong>"
  }

  var posts = []
  posts.push(post);
  posts.push({
    tags: "",
    title: "Cammy in SFV!",
    date: (new Date()).toUTCString(),
    body: "<strong>Cammy is now in Street Fighter V.</strong>"
  })

  var template = Handlebars.compile($("#template").html())

  Handlebars.registerPartial('tag', $("#partial").html())

  $("body").append(template({posts: posts}));
})

