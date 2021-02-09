Rails.application.routes.draw do
  root 'welcome#home'

  get '/invest' => 'welcome#invest'
  get '/save' => 'welcome#save'
  get '/spend' => 'welcome#spend'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  
  resources :users do
    resources :planners
    resources :incomes, :shallow => true
    resources :savings, :shallow => true 
    resources :expenses, :shallow => true
  end
  
  resources :planners do 
    resources :incomes, :shallow => true
    resources :savings, :shallow => true
    resources :expenses, :shallow => true
  end

  delete 'users/:id/planners/:id' => 'planners#destroy'
  
  resources :incomes
  resources :expenses
  resources :savings

end
