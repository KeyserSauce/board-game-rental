require 'open-uri'

class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_game, only: [:show, :edit, :update]

  def new
    @game = Game.new
  end

  def create
    @game             = Game.new(game_params)
    @game.name        = game_params[:name].capitalize!
    @game.user        = current_user
    @game.description = get_description(game_params[:url])

    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end

  end

  def home
    @games = Game.all

    if params[:search]
      @game_results = Game.search(params[:search]).order("created_at DESC")
    else
      @game_results = Game.all.order('created_at DESC')
    end
  end

  def show
    @rental = Rental.new
  end

  def index
    @games = Game.all
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :category, :price, :url, :description, :photo)
  end

  def get_description(url)
    doc = Nokogiri::HTML(open(url))
    description = doc.css('p')[0].text.gsub(/\[.\]/,"") + doc.css('p')[1].text.gsub(/\[.\]/,"")
  end

end
