Cabincontainer::Application.routes.draw do
  resources :homes, only: [:index] do
    collection do
      get :coming_soon
    end
  end
  resource :user_session, only: [:new, :create, :destroy]
  resource :password_reset, only: [:new, :create, :edit, :update]
  resources :manage_categories, except: [:show]
  resources :manage_products do
    member do
      get :edit_photos
      put :upload_photo
      delete :delete_photo
    end
  end
  resources :site_maps, only: [:index]
  resources :faqs, only: [:index]
  resources :customers, only: [:index]
  resources :abouts, only: [:index]
  resources :contacts, only: [:index, :create]
  resources :manage_faqs, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :sliders do
    member do
      get :active
    end
  end
  resources :products do
  	member do
  		get :show_porducts
  	end
  end
  resources :blogs
  root to: "homes#index"

  
  mount Ckeditor::Engine => '/ckeditor'
end
