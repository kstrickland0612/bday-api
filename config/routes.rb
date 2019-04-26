# frozen_string_literal: true

Rails.application.routes.draw do

  # RESTful routes
  resources :examples, except: %i[new edit]
  resources :friends, except: %i[new edit]
  resources :events, except: %i[new edit]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
end
