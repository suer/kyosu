WebsocketRails::EventMap.describe do
  subscribe :client_connected, to: WebsocketController, with_method: :connected
  subscribe :new_message, to: WebsocketController, with_method: :message
end
