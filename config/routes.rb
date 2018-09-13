Rails.application.routes.draw do
  resources :puzzles, only: [:index, :show]

  root 'puzzles#index'
end
