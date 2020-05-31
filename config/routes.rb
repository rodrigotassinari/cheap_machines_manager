Rails.application.routes.draw do

  defaults format: :json do

    resources :projects, only: [:create, :destroy, :show] do
      member do
        get 'machines'
        put 'access_rules'
      end
    end

    resources :machines, only: [:create, :destroy, :show] do
      member do
        put 'start'
        put 'stop'
        post 'resize'
        post 'migrate'
      end
    end

    get '/healthcheck', to: 'status#healthcheck'
    get '/ping', to: 'status#ping'

    root to: 'status#ping'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
