Rails.application.routes.draw do

  get "/api/v1/films/:id/description", to: "api/v1/films#film_details"
  get "/api/v1/films/descriptions", to: "api/v1/films#all_film_details"
  get "/api/v1/films/:id/actors", to: "api/v1/films#film_actors"

  namespace :api do
    namespace :v1 do 
      resources :film_texts
      resources :film_categories
      resources :film_actors
      resources :films
      resources :actors
    end
  end
end
