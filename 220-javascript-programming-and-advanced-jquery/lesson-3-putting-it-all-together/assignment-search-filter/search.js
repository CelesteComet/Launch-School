$(function(){

    // get json items and append on the page

    var items = [{
    "title": "The Legend of Zelda: Majora's Mask 3D",
    "id": 1,
    "category": "Nintendo 3DS"
  }, {
    "title": "Super Smash Bros.",
    "id": 2,
    "category": "Nintendo 3DS"
  }, {
    "title": "Super Smash Bros.",
    "id": 3,
    "category": "Nintendo WiiU"
  }, {
    "title": "LEGO Batman 3: Beyond Gotham",
    "id": 4,
    "category": "Nintendo WiiU"
  }, {
    "title": "LEGO Batman 3: Beyond Gotham",
    "id": 5,
    "category": "Xbox One"
  }, {
    "title": "LEGO Batman 3: Beyond Gotham",
    "id": 6,
    "category": "PlayStation 4"
  }, {
    "title": "Far Cry 4",
    "id": 7,
    "category": "PlayStation 4"
  }, {
    "title": "Far Cry 4",
    "id": 8,
    "category": "Xbox One"
  }, {
    "title": "Call of Duty: Advanced Warfare",
    "id": 9,
    "category": "PlayStation 4"
  }, {
    "title": "Call of Duty: Advanced Warfare",
    "id": 10,
    "category": "Xbox One"
  }]

  var itemTemplate = Handlebars.compile($("script[type='text/x-handlebars']").html());

  $("#gameList").append( itemTemplate({items: items}) )

  var $checkboxes = $("input");

  $checkboxes.on('change', function(e){
    var system = $(e.target).val();
    if (this.checked) {
      $("#gameList li").hide("[data-category='" + system + "']");
    }
    else {
      $("#gameList li").show("[data-category='" + system + "']");
    }
  })


})