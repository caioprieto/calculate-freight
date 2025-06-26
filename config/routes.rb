Rails.application.routes.draw do
  root to: "welcomes#index"

  get "/apresentacao", to: "welcomes#apresentacao"
  get "/acesso_livre", to: "welcomes#acesso_livre"
  get "/temas", to: "welcomes#temas"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_for :admins, skip: [ :registrations ], path: "admin", controllers: { sessions: "admins/sessions" }, path_names: {
    sign_in: "login",
    sign_out: "logout"
  }

  namespace :admin do
    get "dashboard", to: "dashboard#index"
    get "alunos", to: "alunos#index"
    get "pedidos", to: "pedidos#index"
    get "pagamento", to: "pedidos#index"

    resources :words
    resources :messages, only: [ :create ]

    resources :users do
      member do
        patch :toggle_active
      end
    end

    resources :cursos do
      collection do
        post :delete_multiple
        post :add_word
        post :remove_word
      end

      post :destroy_image, on: :member
    end
  end

  namespace :user do
    get "dashboard", to: "dashboard#index"
    get "dashboard/search", to: "dashboard#search", as: :dashboard_search

    get "redacoes", to: "redacoes#index"
    get "redacoes/search", to: "redacoes#search", as: :redacoes_search

    get "settings", to: "settings#index"
    get "explorar", to: "explorar#index"
    get "carrinho", to: "carrinho#index"
    get "pedidos", to: "pedidos#index"

    post "gerar_pedido", to: "pedidos#gerar"

    resources :cursos do
      member do
        get :player
      end
    end

    resources :words do
      member do
        get :proposta
        post :save_timer
      end

      resources :chats do
        resources :messages
      end
    end
  end

  resource :cart, only: [] do
    post "add/:curso_id", to: "cart#add", as: :add_to
    delete "remove/:curso_id", to: "cart#remove", as: :remove_from
  end

  resources :user_aulas
  resources :freights
  resources :cursos
  resources :videos
  resources :pedidos

  get "/success", to: "payments#success"
  get "/cancel", to: "payments#cancel"

  post "/create_checkout_session", to: "payments#create_checkout_session"
  post "calcular_frete", to: "freights#calcular_frete"
  post "importar_fretes", to: "freights#importar_fretes"
end
