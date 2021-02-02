Rails.application.routes.draw do
  root 'welcome#home'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  resources :users do
    resources :planners, :only => [:show,:new,:create] do 
      resources :incomes, :shallow => true
      resources :savings, :shallow => true
    end
    resources :incomes, :shallow => true
    resources :expenses, :shallow => true
    resources :savings, :shallow => true
  end
  
  resources :planners do
    resources :incomes, :shallow => true
  end

  resources :expenses
  resources :savings
  resources :incomes

end
