class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:production_company).order("average_vote DESC")
  end
  # The @movies variable will be automatically shared with the associated view:
  # /app/views/movies/index.html.erb

  # The route to this action has a :id in it. GET /movies/:id
  # And that id ends up in the params hash like this: params[:id]
  def show
    @movie = Movie.find(params[:id])
  end
  # The @movie variable will be automatically shared with the associated view:
  # /app/views/movies/show.html.erb
end
