Rails.application.routes.draw do
  root to: "welcomes#index"

  get "/apresentacao", to: "welcomes#apresentacao"
  get "/acesso_livre", to: "welcomes#acesso_livre"
  get "/temas", to: "welcomes#temas"
  get "/cursos", to: "welcomes#cursos"

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
    get "pagamento", to: "pagamento#index"
    get "correcoes", to: "correcoes#index"
    get "find_by_alunos", to: "correcoes#alunos"
    get "alunos/:id/notifications", to: "alunos#notifications", as: "aluno_notifications"
    get "chats/:id/messages", to: "chats#messages", as: :chat_messages

    resources :correcoes
    resources :temas
    resources :words

    resources :chats, only: [ :show ] do
      resources :messages, only: [ :create ]
    end

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

    post "adicionar_cursos", to: "alunos#adicionar_cursos", as: :adicionar_cursos
    post "adicionar_words", to: "alunos#adicionar_words", as: :adicionar_words
    patch "alterar_vigencia/:id", to: "alunos#alterar_vigencia", as: :alterar_vigencia
    post "enviar_correcao", to: "correcoes#enviar_correcao", as: :enviar_correcao
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
        get :reload_redacao
        post :save_user_word_pdf
        post :concluir
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
  resources :temas, only: :show

  resources :notifications, only: [:index] do
    member do
      patch :marcar_leitura
    end
  end

  resources :favoritos, only: [:create] do
    delete ":tema_id", to: "favoritos#destroy", as: :remove, on: :collection
  end

  get "/success", to: "payments#success"
  get "/cancel", to: "payments#cancel"

  post "/create_checkout_session", to: "payments#create_checkout_session"
  post "calcular_frete", to: "freights#calcular_frete"
  post "importar_fretes", to: "freights#importar_fretes"
end
