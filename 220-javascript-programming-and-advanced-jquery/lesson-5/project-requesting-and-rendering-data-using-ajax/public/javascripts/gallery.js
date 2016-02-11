$(function(){

  // get all the photos as json and cache it

  var gallery = {
    currentImage: 1,
    templates: {},
    collection: [],
    init: function(){
      this.getPhotos();
      this.getComments(this.currentImage);
    },
    bindEvents: function(){

      $("#rightarrow").on('click', $.proxy(function(){
        this.renderPhoto(this.nextImage());
      }, this));

      $("#leftarrow").on('click', $.proxy(function(){
        this.renderPhoto(this.prevImage());
      }, this));

      $("#photo-info").on('click', '#likes', $.proxy(function(){
        $.ajax({
          type: "post",
          url: "/photos/like",
          data: "photo_id=" + this.currentImage,
          success: function(data){  
            $("#likes").html(data.total + " likes");
            gallery.getPhoto(gallery.currentImage).likes = data.total.toString();
          }
        })
      }, this));

      $("#photo-info").on('click', '#favorites', $.proxy(function(){
        $.ajax({
          type: "post",
          url: "/photos/favorite",
          data: "photo_id=" + this.currentImage,
          success: function(data){  
            $("#favorites").html(data.total + " favorites");
            gallery.getPhoto(gallery.currentImage).favorites = data.total.toString();
          }
        })
      }, this));

      $("form").on('submit', $.proxy(function(e){
        e.preventDefault();
        var data = $('form').serialize()
        $.ajax({
          url: '/comments/new',
          type: "post",
          data: data + "&photo_id=" + this.currentImage,
          success: $.proxy(function(json){
            this.getComments(this.currentImage);
          }, this)
        })
      }, this));

    },
    nextImage: function(){
      this.currentImage += 1
      if (this.getPhoto(this.currentImage) == null){
        this.currentImage = 1;
      }
      return this.currentImage;
    },
    prevImage: function(){
      this.currentImage -= 1
      if (this.getPhoto(this.currentImage) == null){
        this.currentImage = this.collection.length;
      }
      return this.currentImage;
    },
    getPhotos: function(){
      $.ajax({
        url: '/photos',
        success: $.proxy(function(json){
          this.collection = json
          this.cacheTemplates();
          this.loadImages();
          this.renderPhoto(gallery.currentImage);
          this.bindEvents();
        }, this)
      })
    },
    getComments: function(id){
      $.ajax({
        url: "/comments?photo_id=" + id,
        success:function(arr){
          gallery.renderComments(arr)
        } 
      })
    },
    getPhoto: function(id){
      var myPhoto;
      myPhoto = this.collection.filter(function(photo){
        return photo.id == id
      })
      return myPhoto[0];
    },
    cacheTemplates: function(){
      $("script[type='text/x-handlebars']").each($.proxy(function(i,tmpl){
        this.templates[$(tmpl).attr('id')] = Handlebars.compile($(tmpl).html());
      }, this))

      Handlebars.registerPartial('comment', $("#comment").html());
    },
    loadImages: function(){
      this.collection.forEach(function(photo){
        $gallery = $("#gallery")
        $gallery.append(gallery.templates.photo(photo));
      })
    },
    renderPhoto: function(id){
      var photo = this.getPhoto(id),
      $gallery = $("#gallery")
      $gallery.find("figure").remove();
      $gallery.append(this.templates.photo(photo));
      this.renderPhotoInfo(photo);
      this.getComments(id);
    },
    renderPhotoInfo:function(photoObject){
      $("#photo-info").children().remove();
      $("#photo-info").append(this.templates['photo-info'](photoObject) )
    },
    renderComments:function(arr){
      $('#comments').html(gallery.templates.comments({comments: arr}))
    }
  }



  gallery.init();




})