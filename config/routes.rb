Rails.application.routes.draw do
  get 'puzzles/index'
  get 'puzzles/show'
  get 'static_pages/home'

  root 'puzzles#index'
end
