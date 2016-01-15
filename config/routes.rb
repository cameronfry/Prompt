Rails.application.routes.draw do
  root :controller => 'static', :action => :index

    resources :forms do
      resources :questions
      resources :drafts
    end

  get '/sign_in', to: 'users#sign_in'
  post '/sign_in', to: 'users#sign_in!'
  get '/sign_up', to: 'users#sign_up'
  post '/sign_up', to: 'users#sign_up!'
  get '/sign_out', to: 'users#sign_out'

end
