class MoviesController < ApplicationController
  def index
    @movies = Movie.order("average_vote DESC")
  end

  def show; end
end
