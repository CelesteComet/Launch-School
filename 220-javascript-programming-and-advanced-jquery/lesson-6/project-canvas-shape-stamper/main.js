$(function(){
  var canvas = $("canvas")[0];

  var ctx = canvas.getContext('2d');

  var method;

  function loadSave(){
    var coordinates = localStorage.getItem('img');
    return coordinates = JSON.parse(coordinates) || [];
  }



  $("input").val('black');
  var color = $("input").val()


  var drawing_methods = {
    square: function(e){
      var side = 30;
      x = e.x - side /2;
      y = e.y - side /2;
      ctx.strokeStyle = e.color;
      ctx.strokeRect(x,y,side,side);
    },
    circle: function(e){
      var radius = 15;
      ctx.strokeStyle = e.color;
      ctx.beginPath();
      ctx.arc(e.x, e.y, radius, 0, ((Math.PI/180) * 360))
      ctx.stroke();
      ctx.closePath();
    },
    triangle: function(e){
      var side = 20;
      var height = (side/2) * Math.sqrt(3);
      ctx.strokeStyle = e.color;
      ctx.beginPath();
      ctx.moveTo(e.x, (e.y - (height/2) ))
      ctx.lineTo(e.x + (side/2), e.y + (height/2)  );
      ctx.lineTo(e.x - (side/2), e.y + (height/2)  );
      ctx.lineTo(e.x, (e.y - (height/2) )  );
      ctx.stroke();
      ctx.closePath();
    }
  }

  coordinates = loadSave();
  draw();

  $(".drawing_method").on('click', function(e){
    e.preventDefault();
    var $current_anchor = $(this);
    var class_name = 'active'

    $current_anchor.closest('ul').find('.' + class_name).removeClass(class_name);
    $current_anchor.addClass(class_name);
    method = $current_anchor.attr('data-method');
  }).eq(0).click();

  $("#clear").on('click', function(){
    $("#savedImage").hide();
    ctx.clearRect(0,0, canvas.width, canvas.height)
    coordinates = [];
  })

  $("canvas").on("mouseenter", function(){
    console.log('entered')
    color = $('input').val()
  })

  $("#save").on("click", function(){
    localStorage.setItem('img', JSON.stringify(coordinates) )
    var img_src = canvas.toDataURL("png");
    img = document.createElement('img')
    img.src = img_src
    $("#savedImage").append(img);
    showSaved();
  })

  function showSaved(){
    $("#savedImage").show();
  }



  function addClick(e){
    coordinates.push({
      x: e.offsetX,
      y: e.offsetY,
      method: method,
      color: color
    });
  }

  $("canvas").mousedown(function(e) {
    addClick(e);
    ctx.clearRect(0,0, canvas.width, canvas.height)
    draw();
    var paint = true
    $("canvas").mousemove(function(e) {
      if(paint){
        addClick(e)
        ctx.clearRect(0,0, canvas.width, canvas.height)
        draw();
      }
    });
    $("canvas").mouseup(function(){
      paint = false
    })
  });

  function draw(){
    for(i in coordinates){
      drawing_methods[coordinates[i].method](coordinates[i]);
    }
  }


})

