function ModelConstructor(options){
  var id_count = 0;
  function Model(attributes){
    var self = this;
    self.__events = []; 
    if (options && _(options).has('change') && _.isFunction(options['change'])){
      self.__events.push(options['change']);
    }    
    this.attributes = attributes || [];
    this.attributes.id 
    this.id = id_count;
    id_count += 1;
  };
  Model.prototype.set = function(prop,value){
    this.attributes[prop] = value;
    this.triggerChange();
  };
  Model.prototype.get = function(prop,value){
    return this.attributes[prop]
  };
  Model.prototype.triggerChange = function(){
    this.__events.forEach(function(__event){
      __event();
    })
  }
  _.extend(Model.prototype,options)
  return Model;
}

function CollectionConstructor(options){
  _.extend(Collection.prototype, options);
  
  function Collection(Model){
    this.model = Model;
    this.models = [];
  };
  Collection.prototype.reset = function(){
    this.models = [];
  };
  Collection.prototype.add = function(object){
    var newModel;
    var self = this;  
    self.models.forEach(function(model){
      if (model.id === object.id) {
        return model;
      }
    });
    newModel = new self.model(object);  
    self.models.push(newModel);
    return newModel;
  };
  Collection.prototype.remove = function(item){

    var id = item;
    var remove_idx;

    if ( !_.isNumber(item) ) { id = item.id }

    this.models.forEach(function(model,idx){
      if (model.id == id) { 
        remove_idx = idx 
      }
    })
    if (remove_idx != undefined) {
      this.models.splice(remove_idx,1)
    };
  }
  return Collection;
}