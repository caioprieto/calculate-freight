Rails.application.routes.draw do
  root to: "welcomes#index"
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  namespace :admin do
    get "dashboard", to: "dashboard#index"
  end

  namespace :user do
    get "dashboard", to: "dashboard#index"
    get "dashboard/search", to: "dashboard#search", as: :dashboard_search

    get "redacoes", to: "redacoes#index"

    get "settings", to: "settings#index"
  end

  resources :freights
  resources :cursos

  post "calcular_frete", to: "freights#calcular_frete"
  post "importar_fretes", to: "freights#importar_fretes"
end
