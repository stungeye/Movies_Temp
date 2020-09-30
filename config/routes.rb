Rails.application.routes.draw do
  get 'production_companies/index'
  get 'production_companies/show'
  # GET /movies      =>  movies#index
  # GET /movies/:id  =>  movies#show
  resources :movies, only: %i[index show]
end
