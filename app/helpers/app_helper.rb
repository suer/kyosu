module AppHelper
  def prepare_sample_code
    [
      "<script src=\"\" type=\"text/javascript\"></script>",
      "<script src=\"\" type=\"text/javascript\"></script>"
    ].join("\n")
  end

  def connection_sample_code(app)
    "var appkey = \"#{app.guid}\";kyosu = new Kyosu(appkey);"
  end

  def subscribe_sample_code
    "var channel = kyosu.subscribe(\"channel\");"
  end

  def event_binding_sample_code
    [
      "channel.bind(\"event\", function(data) {",
      "  console.log(data);",
      "});"
    ].join("\n")
  end

  def publish_sample_code
    [
      "kyosu.publish(\"channel\", \"event\", {",
      "  foo : \"bar\"",
      "});"
    ].join("\n")
  end
end
