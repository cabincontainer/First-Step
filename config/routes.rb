Cabincontainer::Application.routes.draw do
  resources :homes, only: [:index]
  resource :user_session, only: [:new, :create, :destroy]
  resource :password_reset, only: [:new, :create, :edit, :update]
  resources :manage_categories, except: [:show]
  resources :manage_products
  resources :products do
  	member do
  		get :show_porducts
  	end
  end
  root to: "homes#index"
end
