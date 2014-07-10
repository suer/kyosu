$(function(){
    function log(text){
        if(console){ console.log(text); }
        var dom = $("#console");
        dom.html( dom.html() + new Date() + ": " + text + "\n");
    }
    log('start');

    function receiveMessage(message) {
      console.log(message);
    }

    var kyosu = new Kyosu(app.id);
    var channels = [];

    function subscribe(channelName) {
        log("subscribe:" + channelName);
        channels[channelName] = kyosu.subscribe(channelName)
        return channels[channelName];
    }

    function observe(channelName, eventName, func) {
        log("observe:" + eventName + " at " + channelName);
        channels[channelName].bind(eventName, func);
    }

    function publish(channelName, eventName, data) {
        log("publish: channel=" + channelName + ", name=" + eventName + ", data=" + data);
        channels[channelName].trigger(eventName, data);
    }

    function onReceived(data){
        log("receive: data=" + JSON.stringify(data));
    }

    subscribe('demo');
    observe('demo', 'event', onReceived);

    $('#subscribe-button').bind('click', function(e){
        subscribe( $('#subscribe-channel-field').val() );
        return false;
    });

    $('#event-binding-button').bind('click', function(e){
        observe($('#event-binding-channel-field').val(), $('#event-binding-event-name-field').val(), onReceived);
        return false;
    });

    $('#publish-button').bind('click', function(e){
        publish( $('#publish-channel-field').val(),
                 $('#publish-event-name-field').val(),
                 $('#publish-data-field').val() );
        return false;
    });
});
