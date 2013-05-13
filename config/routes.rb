Cabincontainer::Application.routes.draw do
  resources :homes, only: [:index] do
    collection do
      get :coming_soon
    end
  end
  resource :user_session, only: [:new, :create, :destroy]
  resource :password_reset, only: [:new, :create, :edit, :update]
  resources :manage_categories, except: [:show]
  resources :manage_products
  resources :site_maps, only: [:index]
  resources :faqs, only: [:index]
  resources :customers, only: [:index]
  resources :abouts, only: [:index]
  resources :contacts, only: [:index, :create]
  resources :sliders, only: [:index, :new, :create, :destroy]
  resources :manage_faqs, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :products do
  	member do
  		get :show_porducts
  	end
  end
  root to: "homes#index"
end
