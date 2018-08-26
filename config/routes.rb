Rails.application.routes.draw do
  get 'welcome/index'

  resources :teams do
    member do
      get :players
    end
  end

  resources :players do
    member do
      get :teams
    end
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
