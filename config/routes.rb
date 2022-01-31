Rails.application.routes.draw do
  scope 'v1', defaults: { format: :json } do
    devise_for :users, defaults: { format: :json }, path: '',
                       path_names: { sign_in: 'auth', sign_out: 'auth', registration: 'users' },
                       controllers: { sessions: 'v1/users/sessions', registrations: 'v1/users/registrations' }
  end
  namespace :v1, defaults: { format: :json } do
    resources :organisations do
      resources :bank_accounts do
        get :search, on: :collection
      end
    end

    resources :users do
      get :search, on: :collection
    end

    resources :companies do
      get :search, on: :collection
      resources :contacts
    end

    resources :agreements do
      get :search, on: :collection
    end

    resources :projects do
      get :search, on: :collection
    end
    resources :products do
      get :search, on: :collection
    end
    resources :vat_rates do
      get :search, on: :collection
    end
    resources :units do
      get :search, on: :collection
    end

    resources :invoices do
      get :search, on: :collection
      resources :invoice_items
    end
  end
  # all your other routes
  match '*unmatched', to: 'application#route_not_found', via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
