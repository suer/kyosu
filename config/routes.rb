Rails.application.routes.draw do
  get 'app/index'
  get 'app', controller: :app, action: :index

  get 'top/index'

  get 'websocket/index'

  get 'streaming/index'

  root 'top#index'

  devise_for :users, controllers: { omniauth_callbacks: 'authentication' }
  devise_scope :user do
    get 'sign_in', to: 'authentication#login', as: :new_user_session
    delete 'sign_out', to: 'authentication#logout', as: :destroy_user_session
  end
  get ':controller/:action', controller: 'authentication'
end
