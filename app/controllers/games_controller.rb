require 'open-uri'

class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_game, only: [:show, :edit, :update]

  def new
    @game = Game.new
  end

  def create
    @game             = Game.new(game_params)
    @game.user        = current_user
    @game.description = get_description(game_params[:url])

    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end

  end

  def index
    @games = Game.all
  end

  def show
    @rental = Rental.new
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :price, :url, :description, :photo)
  end

  def get_description(url)
    doc = Nokogiri::HTML(open(url))
    description = doc.css('p')[0].text.gsub(/\[.\]/,"") + doc.css('p')[1].text.gsub(/\[.\]/,"")
  end

end
