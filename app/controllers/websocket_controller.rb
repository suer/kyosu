class WebsocketController < WebsocketRails::BaseController
  def initialize_session
    logger.debug("initialize_session")
  end

  def connected
    logger.info "connected"
  end

  def message
    logger.info "message"
#    send_message :new_message, {message: "message"}
  end
end
