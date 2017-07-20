Rails.application.routes.draw do

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :listings do
    resources :reservations
  end


  resources :users, controller: "users", only: [:create, :edit, :update] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/welcome" => "welcome#index", as: "welcome"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post "/verify/:id" => "listings#verify", as: "verify"
  get '/reservations/:id/braintree/new' => "braintree#new", as: "new_payment"
  post '/reservations/:id/braintree/checkout' => "braintree#checkout", as: "braintree_checkout"


  post '/reservations/date' => "reservations/date",as: "date"


  # get "/create_listing" => "clearance/listings#new", as: "create_listing"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'clearance/users#new'

end
