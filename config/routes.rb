Insectogeronizer::Application.routes.draw do
  resources :insects
  resources :papers
  resources :journals do
    get :autocomplete_journal_name, :on => :collection
  end
  root to: 'insects#index'
end
