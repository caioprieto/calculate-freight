Rails.application.routes.draw do
  root to: "freights#index"

  resources :freights

  post "calcular_frete", to: "freights#calcular_frete"
  post "importar_fretes", to: "freights#importar_fretes"
end
