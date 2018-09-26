Rails.application.routes.draw do
  resources :puzzles, only: [:index, :show]

  get '/check', to: 'puzzles#check'
  post '/add_score', to: 'puzzles#add_score'
  root 'puzzles#index'
end
