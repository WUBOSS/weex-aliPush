

const WeexAliPush = {
  show() {
      alert("module WeexAliPush is created sucessfully ")
  }
};


var meta = {
   WeexAliPush: [{
    name: 'show',
    args: []
  }]
};



if(window.Vue) {
  weex.registerModule('WeexAliPush', WeexAliPush);
}

function init(weex) {
  weex.registerApiModule('WeexAliPush', WeexAliPush, meta);
}
module.exports = {
  init:init
};
