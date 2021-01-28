Rails.application.routes.draw do
  root 'welcome#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  resources :users do
    resources :planners, :shallow => true
    resources :incomes, :shallow => true
    resources :expenses, :shallow => true
    resources :savings, :shallow => true
  end
  
  resources :planners
  resources :expenses
  resources :savings
  resources :incomes

end
