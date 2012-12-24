Insectogeronizer::Application.routes.draw do
  resources :insects
  resources :papers
  resources :journals
  root to: 'insects#index'
end
