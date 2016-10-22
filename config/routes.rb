Rails.application.routes.draw do
  get 'invites/create'

  resources :organizacoes
  resources :projetos
  resources :nao_conformidades
  devise_for :users, controllers: { registrations: "registrations" }
  resources :checklists do
    member do
      get 'aplicacao'
    end
  end

  resources :aplicacoes do
    resources :respostas
  end

  get 'admin/' => 'admin#index'
  get 'get_checklist_itens' => 'nao_conformidades#get_checklist_itens'
  get 'get_responsaveis' => 'nao_conformidades#get_responsaveis'

  root 'checklists#index'
  
  post 'admin/trocar_papel' => 'admin#trocar_papel'

  post 'aplicacoes/:aplicacao_id/respostas/salvar_respostas' => 'respostas#salvar_respostas'

  post 'nao_conformidades/salvar_status' => 'nao_conformidades#salvar_status'

  post 'nao_conformidades/alertar_responsavel' => 'nao_conformidades#alertar_responsavel'
  
  resources :invites
end
