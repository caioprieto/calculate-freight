Rails.application.routes.draw do
  root to: "welcomes#index"
  devise_for :users

  namespace :admin do
    get "dashboard", to: "dashboard#index"
  end

  resources :freights

  post "calcular_frete", to: "freights#calcular_frete"
  post "importar_fretes", to: "freights#importar_fretes"
end
