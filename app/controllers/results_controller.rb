class ResultsController < ApplicationController
  def index
    @game_results = Game.search(params[:search]).order("created_at DESC")
  end
end
