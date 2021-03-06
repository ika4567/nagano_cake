class Admin::GenresController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :new, :create, :edit, :update]

  def index
    @genres = Genre.all
  end

  def new
    @new = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.permit(:name)
  end

end
