Rails.application.routes.draw do
  resources :puzzles, only: [:index, :show]

  get '/check', to: 'puzzles#check'
  
  root 'puzzles#index'
end
