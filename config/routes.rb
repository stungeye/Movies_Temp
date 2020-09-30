Rails.application.routes.draw do
  # GET /movies      =>  movies#index
  # GET /movies/:id  =>  movies#show
  resources :movies, only: %i[index show]
  resources :production_companies, only: %i[index show]

  # GET /   => home#index
  root to: "home#index"
end
