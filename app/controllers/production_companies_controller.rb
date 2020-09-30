class ProductionCompaniesController < ApplicationController
  def index
    @production_companies = ProductionCompany.all
  end
  # In the associated index view:
  # - List all the companies in an unordered list with each being a link to the show page.

  def show
    @production_company = ProductionCompany.find(params[:id])
  end
  # In the associated show view:
  # - Display the name of the Production Company.
  # - Display a list of links to all the movies made by this production company.
end

# Meanwhile, over at the movie show page:
# - Display the other movie details we have available. (description, year, duration, etc)
# - Display the name of the production company that made the movie.
# - Ensure that this name is also a link to the production company's show page.
