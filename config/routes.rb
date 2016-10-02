Rails.application.routes.draw do
  resources :organizacoes
  resources :projetos
  resources :nao_conformidades
  #devise_for :users
  devise_for :users, controllers: { registrations: "registrations" }
  resources :checklists do
    member do
      get 'aplicacao'
    end
  end

  resources :aplicacoes do
    #member do
      #post controller: :respostas, action: :salvar_respostas
      #get controller: :respostas, action: :index
    #end
    #resources :respostas, only: [:salvar_respostas, :index]
    resources :respostas
  end

  #namespace :aplicacoes do
   # resources :respostas
    #post controller: :respostas, action: :salvar_respostas
    #get controller: :respostas, action: :index
  #end

  get 'admin/' => 'admin#index'
  get 'get_checklist_itens' => 'nao_conformidades#get_checklist_itens'
  get 'get_responsaveis' => 'nao_conformidades#get_responsaveis'

  root 'checklists#index'
  
  post 'admin/trocar_papel' => 'admin#trocar_papel'

  post 'aplicacoes/:aplicacao_id/respostas/salvar_respostas' => 'respostas#salvar_respostas'

  post 'nao_conformidades/salvar_status' => 'nao_conformidades#salvar_status'

  post 'nao_conformidades/alertar_responsavel' => 'nao_conformidades#alertar_responsavel'

  #get 'respostas/index' => 'respostas#index'


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
