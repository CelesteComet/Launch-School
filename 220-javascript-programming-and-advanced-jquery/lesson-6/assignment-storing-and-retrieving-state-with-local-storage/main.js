$(function(){

  $("textarea").val(localStorage.getItem('text'));

  var articles = {
    $tabs: $("#tabs li"),
    init: function(){
      if (localStorage.getItem('id')) {
        this.changeToActive(localStorage.getItem('id'))
        this.showArticle(localStorage.getItem('id'))
      }
      this.bindEvents();
    },
    changeToActive: function(id){
      this.$tabs.removeClass('active');
      this.$tabs.filter("[data-id=" + id + "]").addClass('active')
    },
    showArticle: function(id){
      $('p').hide().filter("[data-id=" + id + "]").show();
    },
    bindEvents: function(){
      $("#tabs li").on('click', $.proxy(function(e){
        var id = $(e.target).parent().attr('data-id');
        this.changeToActive(id);
        this.showArticle(id);
        localStorage.setItem('id', id )
      }, this))
    }
  }

  var background = {
    currentColor: $("input[name='color']:checked").val(),
    init: function(){
      $("body").css({
        background: localStorage.getItem("color")
      })
      this.bindEvents();
    },
    bindEvents: function(){
      $("input").on('click', function(){
        $("body").css({background: $(this).val()})
        localStorage.setItem("color", $(this).val())
      })
    }
  }

  $("textarea").on('blur', function(){
    localStorage.setItem('text', $("textarea").val() ) 
  })
  articles.init();
  background.init();

})