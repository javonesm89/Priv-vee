Rails.application.routes.draw do
  root 'welcome#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  resources :users do
    resources :expenses
    resources :savings
    resources :incomes
  end

  resources :expenses
  resources :savings
  resources :incomes

end
