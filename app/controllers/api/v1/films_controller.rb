class Api::V1::FilmsController < ApplicationController

  # GET /films
  def index
    if params[:title]
      value = params[:title].downcase.gsub(/[^[:word:]\s]/, ' ')  #strips out non-alphanumeric characters and replaces with whitespace
      @film = Film.find_by(title: value)
      if @film
        render json: FilmSerializer.new(@film), status: :ok
      else
        render json: "No results", status: :ok
      end
    elsif params[:rating]
      @films = Film.find_by_params('rating', params[:rating])
      if @films
      render json: FilmSerializer.new(@films), status: :ok
      else
        render json: "No results", status: :ok
      end
    elsif params[:category]
      @films = Film.find_by_category(params[:category])
      if @films
        render json: FilmSerializer.new(@films), status: :ok
      else
        render json: "No results", status: :ok
      end
    else
    @films = Film.all
    render json: FilmSerializer.new(@films), status: :ok
    end
  end

  # GET /films/1
  def show
    @film = Film.find(params[:id])
    if @film
      render json: FilmSerializer.new(@film), status: :ok
    else
      render json: "Film not found, please try again.", status: :ok
    end
  end

  def film_details
    @film = Film.find(params[:id])
    if @film
      render json: {
        description: @film.description
      }, status: :ok
    else
      render json: "Film not found, please try again.", status: :ok
    end
  end

  def all_film_details
    @films = Film.all
    @film_details = []
    @films.each do |film|
      @film_details << film.description
    end
    render json: {
      descriptions: @film_details
    }, status: :ok
  end

  def film_actors
    @film = Film.find(params[:id])
    if @film
      @actors = @film.find_actors
    render json: {
      actors: @actors
    }, status: :ok
    else
      render json: "Film not found, please try again.", status: :ok
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.
    def film_params
      params.require(:film).permit(:title, :description, :rating, :category)
    end
end
