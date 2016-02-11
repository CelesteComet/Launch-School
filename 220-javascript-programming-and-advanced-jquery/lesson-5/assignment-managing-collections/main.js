$(function(){

  var inventory = {
    collection: [],
    last_id: 0,
    add: function(){
      this.last_id += 1;
      var obj = {
        id: this.last_id,
        name: '',
        stockNumber: '',
        quantity: ''
      }
      this.collection.push(obj);
      return obj;
    },
    get: function(id){
      var myItem;
      this.collection.forEach(function(item){
        if (item.id == id){
          myItem = item
        }
      })
      return myItem;
    },
    remove: function(id){
      this.collection = this.collection.filter(function(item){
        return item.id != id;
      })
    },  
    newItem: function(){
      var item = this.add();
      var $item = $(this.template.replace(/ID/g, item.id));
      $("#items").append($item)
    },
    deleteItem: function(e){
      e.preventDefault();
      var id  = $(e.target).attr('id');
      $(e.target).parent('li').remove();
      this.remove(id);
    },
    updateItem: function(e){
      var id = $(e.target).attr('id')
      var item = this.get(id)
      item[e.target.name] = $(e.target).val()
      console.table(inventory.collection)
    },
    renderDate: function(){
      $("time").html((new Date()).toUTCString());
    },
    cacheTemplate: function(){
      this.template = $("script[type='text/template']").html();
    },
    init: function(){
      this.renderDate();
      this.cacheTemplate();
      this.bindEvents();
    },
    bindEvents: function(){
      $("#newItem").on('click', $.proxy(function(e){
        e.preventDefault();
        this.newItem();
      },this))
      $("#items").on('click', 'a', $.proxy(this.deleteItem, this))
      $("#items").on('blur', ':input', $.proxy(this.updateItem, this))
    }
  };

  inventory.init()
  window.inventory = inventory;
})