Rails.application.routes.draw do
  get 'top/index'

  get 'websocket/index'

  get 'streaming/index'

  root 'top#index'
end
