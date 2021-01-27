Rails.application.routes.draw do
  root 'welcome#home'
  
  resources :users do
    resources :expenses
    resources :savings
    resources :incomes
  end

  resources :expenses
  resources :savings
  resources :incomes

end
