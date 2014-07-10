
function Kyosu(apikey) {
    this.initialize(this, apikey);
    return this;
}

(function(klass, document) {
  klass.prototype.initialize = function(apikey) {
    this.app = app;
    this.dispatcher = new WebSocketRails("localhost:3000/websocket", true);
    this.channels = []
  }

  klass.prototype.subscribe = function(channelName){
    var channel = this.dispatcher.subscribe(channelName)
    this.channels[channelName] = channel
    return channel;
  };
})(Kyosu, document);
