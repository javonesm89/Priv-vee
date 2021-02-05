Rails.application.routes.draw do
  root 'welcome#home'

  get '/invest' => 'welcome#invest'
  get '/save' => 'welcome#save'
  get '/spend' => 'welcome#spend'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  
  resources :users do 
    resources :planners do
      resources :incomes
      resources :savings
      resources :expenses
    end
  end

  delete 'users/:id/planners/:id' => 'planners#destroy'
  
  resources :planners
  resources :incomes
  resources :expenses
  resources :savings

end
