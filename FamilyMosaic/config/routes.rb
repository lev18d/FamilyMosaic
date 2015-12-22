Rails.application.routes.draw do
  devise_for :users, path: "", :controllers => { sessions: "sessions", registrations: "registrations" }
  devise_scope :user do
    get '/signup/:invite_token' => 'registrations#new', as: 'signup'
  end
	# devise_for :users, :skip => [:registrations]                                          
  root 'pages#home' 
  resources :posts
  resources :stories
  resources :events
  # resources :trees
  resources :categories
  resources :contents
  resources :timelines
  resources :profiles
  resources :users
  resources :invites
  resources :histories
  get '/about', to: 'pages#about' 
  get '/features', to: 'pages#features'
  get '/support', to: 'pages#support'
  get '/profile_edit', to: 'profiles#edit', as: 'profile_edit'
  get '/profile_edit_profile', to: 'profiles#edit_profile', as: 'profile_edit_profile'
  get '/history_edit', to: 'histories#edit', as: 'history_edit'
  post '/history_create', to: 'histories#create', as: 'history_create'
  get '/history_new', to: 'histories#new', as: 'history_new'
  # get '/profile', to: 'profiles#show', as: 'my_profile'
  get '/tree', to: 'trees#show', as: 'tree'
  post 'trees/addchild', to: "trees#add_child"
  post 'trees/addspouse', to: "trees#add_spouse"
  post 'trees/addparent', to: "trees#add_parent"
  post 'trees/del_node', to: "trees#del_node"
  post 'email_responses/bounce' => 'email_responses#bounce'
  post 'email_responses/complaint' => 'email_responses#complaint'
  # get '/timeline', to: 'pages#timeline', as: 'timeline'
  get '/my_profile', to: 'profiles#edit', as: 'my_profile'
  # get '/timeline_nav_example', to: 'pages#timeline_nav_example'
  #map.signup '/signup/:invite_token', to: 'users#new'
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'
  get 'terms', to: 'pages#terms', as: 'terms'

  get 'user_contact', to: 'u_messages#new', as: 'u_contact'
  post 'user_contact', to: 'u_messages#create'
  
end