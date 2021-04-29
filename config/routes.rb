def lazy_resources(name)
  resources name, controller: 'database'
end

Rails.application.routes.draw do

  get 'finances/bank_reconciliation'
  get 'finances/balance_sheet'
  get 'finances/financial_statement'
  get 'spendings/monthly'
  get '/database', to: 'database#dashboard', as: 'database'
  post '/db/create_table', to: 'apps#create_table', as: 'db_create_table'
  post '/db/:model_name/create_column', to: 'apps#create_column', as: 'db_create_column'
  lazy_resources :suppliers
  lazy_resources :parts
  lazy_resources :purchases
  lazy_resources :part_list_items
  lazy_resources :shopping_items
  lazy_resources :spendings

  get 'dashboard/index'
  root 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
