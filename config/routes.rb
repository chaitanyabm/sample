Rails.application.routes.draw do
  concern :active_scaffold_association, ActiveScaffold::Routing::Association.new
  concern :active_scaffold, ActiveScaffold::Routing::Basic.new(association: true)
  resources :events, concerns: :active_scaffold
  root :to => "posts#index"
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
