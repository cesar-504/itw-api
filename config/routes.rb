Rails.application.routes.draw do
  resources :publications do
    resources :objectives
    collection do
      get 'more'
    end
  end

  resources :items
  resources :objectives

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
end
