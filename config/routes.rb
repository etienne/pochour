Pochour::Application.routes.draw do
  root :to => "home#index"
  
  scope(:path_names => { :new => "nouveau", :edit => "modifier" }) do
    devise_for :users, :path => "compte", :path_names => { :sign_in => 'connectation',
                                                           :sign_out => 'deconnectation',
                                                           :password => 'mot-de-passe',
                                                           :confirmation => 'confirmation',
                                                           :unlock => 'debloquer',
                                                           :registration => 'enregistrer',
                                                           :sign_up => 'inscription' }
  
    # resources :users, :only => [:index, :edit]
    
    # resources :users, :path => "gens" do
    #   resources :articles do
    #     resources :comments
    #   end
    # end
    
    get "accueil/page/:page" => "home#index"
    get "publier" => 'articles#new', :as => :new_article
    post "publier" => 'articles#create', :as => :articles
    get ":user_id(/page/:page)" => 'users#show', :as => :user
    get ":user_id/:id" => 'articles#show', :as => :user_article
    put ":user_id/:id" => 'articles#update', :as => :user_article
    get ":user_id/:id/modifier" => 'articles#edit', :as => :edit_user_article
    post ":user_id/:article_id/commentation" => 'comments#create', :as => :user_article_comments
    post ":user_id/:article_id/epithete" => 'epithets#create', :as => :user_article_epithets
    post 'recherche/membre' => 'users#find', as: :find_user
  end
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
