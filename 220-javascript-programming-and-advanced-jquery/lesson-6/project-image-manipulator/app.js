var canvas = document.createElement("canvas");
var ctx = canvas.getContext('2d');

var preloader = {
  path: 'images/',
  srcs: ['1.jpg', '2.jpg', '3.jpg'],
  createImage: function(src) {
    var $img = $("<img/>", {src: this.path + src})
    $img.on('load', manipulator.process.bind(manipulator));
  },
  run: function(){
    this.srcs.forEach( this.createImage.bind(this) )
  }
};

var manipulator = {
  drawImage: function(img){
    canvas.width = img.width;
    canvas.height = img.height;
    ctx.drawImage(img,0,0);
  },
  getData: function(img){
    return ctx.getImageData(0,0,canvas.width, canvas.height).data
  },
  getDatObj: function(img){
    return ctx.getImageData(0,0,canvas.width, canvas.height)
  },
  process: function(event){
    var img = event.target;
    this.drawImage(img);
    var data = this.getDatObj(img);
    console.log(data.data)
    var gray_data;
    for (var i = 0, len = data.data.length; i < len; i += 4) {
      gray_data = data.data[i] * 0.3086 + data.data[i+1] * 0.6094 + data.data[i+2] * 0.0820;
      data.data[i] = gray_data;
      data.data[i+1] = gray_data;
      data.data[i+2] = gray_data;
    }
    console.log(data.data)
    ctx.putImageData(data, 0, 0);
    var img_src = canvas.toDataURL("png");
    var img = document.createElement('img');
    img.src = img_src;
    document.body.appendChild(img);
  }
}

$(preloader.run.bind(preloader));