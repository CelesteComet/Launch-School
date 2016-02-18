var App = {
  $el: $("main"),
  $todos: $("#todos"),
  newTodo: function(e){
    e.preventDefault();
    var name = $(e.target).find("#todo_name").val();

    if (!name) { return; }

    var model = this.Todos.add({
      name: name,
      complete: false
    })
    var view = new this.TodoView(model);
    view.$el.appendTo(this.$todos);

    e.target.reset();
  },
  bind: function(){
    this.$el.find("form").on('submit', this.newTodo.bind(this));
  },
  init: function(){
    this.bind();
  }
};

var templates = {};

$("script[type='text/x-handlebars']").each(function(){
  var $this = $(this);
  templates[$this.attr("id")] = Handlebars.compile($this.html())
})

// Todo model constructor; used in our todos collection
App.TodoConstructor = new ModelConstructor();

// Todo collection constructor
App.TodosConstructor = new CollectionConstructor();

// The todo collection creation
App.Todos = new App.TodosConstructor(App.TodoConstructor);

// The todo view constructor
App.TodoView = new ViewConstructor({
  tag_name: "li",
  template: templates.todo
});

App.init();

