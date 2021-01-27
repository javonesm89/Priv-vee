Rails.application.routes.draw do
  root 'welcome#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  resources :users do
    resources :incomes, :shallow => true
    resources :expenses
    resources :savings
  end

  resources :expenses
  resources :savings
  resources :incomes

end
