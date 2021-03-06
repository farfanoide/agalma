Agalma::Application.routes.draw do


  get 'search/index'
  resources :galeries, only: [:index, :show]
  resources :images, only: [:show]

  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  get 'paginas/consultorios_externos' => 'branches#consultorios_externos', as: :consultorios_externos
  get 'paginas/nuestras_sedes' => 'branches#nuestras_sedes', as: :nuestras_sedes
  post 'branches/set_frontend_branch' => 'branches#set_frontend_branch', as: :set_frontend_branch
  resources :paginas, only: [:show, :index], controller: :pages, as: :pages
  resources :sucursales, only: [:show], controller: :branches, as: :branches
  resources :posts, only: [:show, :index]
  resources :roles
  resources :contacts, only: [:new, :create]
  namespace :backend do
    resources :branches
    resources :contacts, only: [:new, :create]
    post 'dashboard/set_current_branch' => 'dashboard#set_current_branch'
    resources :external_branches
    resources :galeries, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :image_sliders
    resources :menus
    resources :pages
    resources :positions
    resources :posts
    resources :users
    get "mailer/index"
    post "mailer/send"
    root 'dashboard#home'
  end

  root 'posts#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
