Rails.application.routes.draw do
  get 'puzzles/index'
  get 'puzzles/show'

  root 'puzzles#index'
end
