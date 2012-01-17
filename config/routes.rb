FirstApp::Application.routes.draw do
  root :to => 'business_lines#index'

  resources :business_lines
end
