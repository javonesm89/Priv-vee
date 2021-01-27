Rails.application.routes.draw do
  resources :expenses
  resources :savings
  resources :incomes
  root 'welcome#home'
  resources :users
end
