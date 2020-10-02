class HomeController < ApplicationController
  def index
    @movies = Movie.includes(:production_company)
                   .order("average_vote DESC")
                   .limit(10)

    @production_companies = ProductionCompany.left_joins(:movies)
                                             .group("production_companies.id")
                                             .select("production_companies.*")
                                             .select("count(movies.id) as movie_count")
                                             .order("movie_count DESC")
                                             .limit(10)
  end
end
