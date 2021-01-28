Rails.application.routes.draw do
  resources :planners
  root 'welcome#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  resources :users do
    resources :incomes, :shallow => true
    resources :expenses, :shallow => true
    resources :savings, :shallow => true
  end

  resources :expenses
  resources :savings
  resources :incomes

end
