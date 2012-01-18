FirstApp::Application.routes.draw do

  root :to => 'dashboards#index'

  resources :business_lines
  resources :expenses

  # match '/dashboards' => 'dashboards#index'
end
