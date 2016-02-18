function ModelConstructor(options){
  var id_count = 0;
  function Model(){
    this.attributes = {};
    this.attributes.id 
    this.id = id_count;
    id_count += 1;
  };
  Model.prototype.set = function(prop,value){
    this.attributes[prop] = value;
  }
  Model.prototype.get = function(prop,value){
    return this.attributes[prop]
  }
  _.extend(Model.prototype,options)
  return Model;
}