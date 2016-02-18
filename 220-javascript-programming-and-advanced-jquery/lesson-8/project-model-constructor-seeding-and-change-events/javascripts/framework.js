function ModelConstructor(options){
  var id_count = 0;
  function Model(attributes){
    var self = this;
    self.__events = []; 
    if (_(options).has('change')){
      if (_.isFunction(options['change'])){
        self.__events.push(options['change']);
      }
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