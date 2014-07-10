
function Kyosu(app) {
    this.initialize(app);
    return this;
}

(function(klass, document) {
  var currentScript = (function (e) {
      if(e.nodeName.toLowerCase() == 'script') return e;
      else return arguments.callee(e.lastChild)
  })(document);
  var host = currentScript.src.replace(/^https?:\/\/(.[^\/]*)\/.*/,'$1');

  klass.prototype.initialize = function(app) {
    this.app = app;
    this.dispatcher = new WebSocketRails(host + "/websocket", true);
  }

  klass.prototype.subscribe = function(channelName){
    var channel = this.dispatcher.subscribe(channelName)
    return channel;
  };
})(Kyosu, document);
