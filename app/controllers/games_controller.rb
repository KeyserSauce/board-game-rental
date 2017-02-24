require 'open-uri'

class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_action :set_game, only: [:show, :edit, :update]

  def new
    @game = Game.new
  end

  def create
    @game             = Game.new(game_params)
    @game.name        = @game.name.capitalize
    if game_params[:photo].empty? && get_photo_url(game_params[:name])
      @game.photo_url = get_photo_url(game_params[:name])
    else
      @game.photo_url = "https://www.placecage.com/c/150/175"
    end
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

  def get_photo_url(name)
    name = name.strip.gsub(" ","+")
    results = Nokogiri::HTML(open("https://www.google.dk/search?q=#{name}+game&rlz=1C5CHFA_enUS720US721&espv=2&biw=1280&source=lnms&tbm=isch&sa=X&ved=0ahUKEwiHr_nZz6jSAhXH0hoKHRMOAqwQ_AUICCgB&bih=652"))
    url = results.css('a')[35].children[0]["src"]
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :category, :price, :url, :description, :photo)
  end

  def get_description(url)
    url.match(/ /) || url.empty? ? description = url : doc = Nokogiri::HTML(open(url))
    description ||= doc.css('p')[0].text.gsub(/\[.\]/,"") + doc.css('p')[1].text.gsub(/\[.\]/,"")
    description
  end



end
