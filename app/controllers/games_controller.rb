class GamesController < ApplicationController

  before_action :set_game, only: [:show, :edit, :update]


  def index
  end

  def show
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

end
