# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  default_url_options host: ENV['DEFAULT_URL']

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  post '/graphql', to: 'graphql#execute'
  
  get '/company-admin', to: 'company_admin#index'
  
  devise_for :users,
             controllers: {
               confirmations: 'auth/confirmations',
               passwords: 'auth/passwords',
               invitations: 'auth/invitations'
             },
             skip: :registrations # skip registration route

  # Just a blank root path
  root 'pages#blank'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
end
