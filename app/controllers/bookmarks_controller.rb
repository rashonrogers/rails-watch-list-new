class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_movie, only: %i[new create]

  def new
    @bookmark = Bookmark.new
    @list = List.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    logger.debug(@bookmark.movie_id)
    logger.debug(@bookmark.list_id)
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new
    end
  end

  def destroy
    list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
