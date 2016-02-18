(function() {
  _ = function(element){
    var u = {
      first: function(){
        return element[0];
      },
      last: function(){
        return element[element.length - 1];
      },
      without: function(e){
        var arr = new Array();
        Object.assign(arr, element);
        for (var i = 0; i < arguments.length; i++){
          arr.splice(element.indexOf(arguments[i]),1);
        }
        return arr;
      },
      lastIndexOf: function(e){
        for (var i = element.length; i >= 0; i--){
          if (element[i] === e) {return i};
        }
      },
      sample: function(n){
        var samples = [];
        var arr = [];
        Object.assign(arr,element);
        function get(){
          var idx = Math.floor((Math.random() * arr.length));
          var el = arr[idx];
          arr.splice(idx,1);
          return el;
        }

        if(!n){return get()}
        while(n > 0){
          var new_num = get();
          samples.push(new_num);
          n--;
        }
        return samples;
      },
      findWhere: function(object){
        var hasAll = undefined;
        element.forEach(function(compare){
          for (prop in object){
            if (object[prop] != compare[prop]){return}
          }
        if (!hasAll){hasAll = compare;}
        })
        return hasAll;
      },
      where: function(object){
        var array = [];
        element.forEach(function(compare){
          for (prop in object){
            if (object[prop] != compare[prop]){return}
          }
          array.push(element);
        })
        return array;
      },
      pluck: function(key){
        var array = [];
        element.forEach(function(compare){
          if (compare[key] != undefined){
            array.push(compare[key])
          }
        })
        return array;
      },
      keys: function(){
        var array = [];
        for(prop in element){
          array.push(prop);
        }
        return array;
      },
      values: function(){
        var values = []
        for (prop in element){
          values.push(element[prop]);
        }
        return values;
      },
      pick: function(key){
        var new_obj = {};
        for (i = 0; i < arguments.length; i++){
          if (element[arguments[i]]){
            new_obj[arguments[i]] = element[arguments[i]];
          }
        }
        return new_obj;
      },
      omit: function(key){
        var new_obj = {};
        for (i = 0; i < arguments.length; i++){
          if (!element[arguments[i]]){
            new_obj[arguments[i]] = element[arguments[i]];
          }
        }
        return new_obj;
      },
      has: function(key){
        if (element[key]){
          return true
        }
      }
    };
    return u;
  }

  _.range = function(n,s){
    var array = [];
    if (n && s) {
      for (var i = n; i < s; i++){
        array.push(i);
      }
      return array;
    }
    if (n) {
      for (var i = 0; i < n; i++){
        array.push(i);
      }
      return array;
    }
  }

  _.extend = function(){
    var new_obj = arguments[arguments.length - 2];
    var old_obj = arguments[arguments.length - 1];
    // iterate through new obj properties and add them to old obj
    for (props in old_obj){
      new_obj[props] = old_obj[props];
    }

    if (arguments.length == 2) { 
      return new_obj 
    };

    return this.extend(new_obj,old_obj)
  }

  _.isElement = function(obj){
    if (obj.nodeType === 1) { return true}
  };

  _.isArray = function(obj){
    if (obj instanceof Array) { return true}
  };

  _.isObject = function(obj){
    if (obj instanceof Object) { return true}
  };

  _.isFunction = function(obj){
    if (obj instanceof Function) { return true}
  };

  _.isBoolean = function(obj){
    if (toString.call(obj) == '[object Boolean]') {return true}
  };

  _.isString = function(obj){
    if (toString.call(obj) == '[object String]') {return true}
  };

  _.isNumber = function(obj){
    if (toString.call(obj) == '[object Number]') {return true}
  };
})();