Rails.application.routes.draw do
  get "movies" => "movies#index"
  get "movie/:id" => "movies#show", as: 'movie'
end
