Rails.application.routes.draw do
  resources :url_links
  resources :mymails do
    collection do       
      get :solicita_teste  
      get :solicita    
      get :check
      get :get_lista
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
